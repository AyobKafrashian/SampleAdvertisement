using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebCrawling.Convertor;
using WebCrawling.Models;
using WebCrawling.Services.Interfaces;

namespace WebCrawling.Services.Implementasion
{
    public class CrawleringService : ICrawleringService
    {
        public async Task<List<DivarDataResponse>> DivarCrawl(Uri url, string tag, string className)
        {
            try
            {
                #region Response Model List
                List<DivarDataResponse> innerHtmlList = new List<DivarDataResponse>();
                #endregion

                #region Request and Load Data
                var httpClient = new HttpClient();
                var html = await httpClient.GetStringAsync(url);

                var htmlDocument = new HtmlDocument();
                htmlDocument.LoadHtml(html);
                #endregion

                #region Filter html Crawler by Tag and ClassName
                var nodes = htmlDocument.DocumentNode.Descendants(tag).Where(c => c.GetAttributeValue("class", "").Equals(className)).ToList();
                #endregion

                #region Get Data and Add To Model
                foreach (var node in nodes)
                {
                    if (node.Attributes["class"]?.Value == className)
                    {
                        DivarDataResponse data = new DivarDataResponse();

                        #region Title data
                        string title = node.Descendants("a").FirstOrDefault()?.ChildAttributes("title").FirstOrDefault()?.Value.ToString();

                        if (!string.IsNullOrEmpty(title))
                            data.Title = JsonConvertor.ToJson(title).ClearedUrl();
                        else
                            data.Title = "";

                        #endregion

                        #region urlLink data
                        string urlLink = node.Descendants("a").FirstOrDefault()?.ChildAttributes("href").FirstOrDefault()?.Value.ToString();

                        if (!string.IsNullOrEmpty(urlLink))
                            data.UrlLink = new Uri(data.UrlLink, JsonConvertor.ToJson(urlLink).ClearedUrl());
                        else
                            data.UrlLink = null;
                        #endregion

                        #region Image data
                        string imageSrc;
                        if (node.Descendants("img").SingleOrDefault()?.ChildAttributes("data-src").SingleOrDefault()?.Value == null)
                        {
                            imageSrc = "none";
                        }
                        else
                        {
                            imageSrc = node.Descendants("img").SingleOrDefault().ChildAttributes("data-src").SingleOrDefault().Value;
                        }
                        data.PictureLink = JsonConvertor.ToJson(imageSrc.ToString()).ClearedUrl();

                        #endregion

                        #region Rent data
                        var prices = node.Descendants("div").Where(d => d.Attributes["class"]?.Value == "kt-post-card__description").ToList();
                        string rent = "";
                        if (prices.Any())
                        {
                            foreach (var price in prices)
                            {
                                if (rent.Length > 0)
                                    rent += " - ";

                                rent += price.InnerHtml;
                            }
                            data.Rent = JsonConvertor.ToJson(rent).ClearedUrl();
                        }
                        else
                            data.Rent = "";
                        #endregion

                        innerHtmlList.Add(data);
                    }
                }
                #endregion

                if (innerHtmlList.Any())
                    return innerHtmlList;

                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}