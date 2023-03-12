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
        public async Task<List<DataCrawlerResponse>> DivarSiteCrawl(Uri url, string tag, string className)
        {
            try
            {
                #region Response Model List
                List<DataCrawlerResponse> innerHtmlList = new List<DataCrawlerResponse>();
                #endregion

                #region Get html Nodes by Link
                List<HtmlNode> nodes = await GetHtmlNodes(url, tag, className);
                #endregion

                #region Get Data and Add To Model
                foreach (var node in nodes)
                {
                    if (node.Attributes["class"]?.Value == className)
                    {
                        DataCrawlerResponse data = new DataCrawlerResponse("Divar", "https://divar.ir");

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
                        string imageSrc = node.Descendants("img").SingleOrDefault()?.ChildAttributes("data-src").SingleOrDefault()?.Value.ToString();
                        if (!string.IsNullOrEmpty(imageSrc))
                            data.PictureLink = JsonConvertor.ToJson(imageSrc).ClearedUrl();
                        else
                            data.PictureLink = "";
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

        public async Task<List<DataCrawlerResponse>> KilidSiteCrawl(Uri url, string tag, string className)
        {
            try
            {
                #region Response Model List
                List<DataCrawlerResponse> innerHtmlList = new List<DataCrawlerResponse>();
                #endregion

                #region Get html Nodes by Link
                List<HtmlNode> nodes = await GetHtmlNodes(url, tag, className);
                #endregion

                #region Get Data and Add To Model
                foreach (var node in nodes)
                {
                    if (node.Attributes["class"]?.Value == className)
                    {
                        DataCrawlerResponse data = new DataCrawlerResponse("Kilid", "https://kilid.com");

                        #region Title data
                        string title = node.Descendants("h2").Where(d => d.Attributes["class"]?.Value == "title").FirstOrDefault()?.InnerHtml;

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
                        string imageSrc = node.Descendants("img").SingleOrDefault()?.ChildAttributes("src").SingleOrDefault()?.Value.ToString();
                        if (!string.IsNullOrEmpty(imageSrc))
                            data.PictureLink = JsonConvertor.ToJson(imageSrc.ToString()).ClearedUrl();
                        else
                            data.PictureLink = "none";
                        #endregion

                        #region Rent data
                        var prices = node.Descendants("span").Where(d => d.Attributes["class"]?.Value == "ng-star-inserted").ToList();
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

        public async Task<List<DataCrawlerResponse>> ShabeshSiteCrawl(Uri url, string tag, string className)
        {
            try
            {
                #region Response Model List
                List<DataCrawlerResponse> innerHtmlList = new List<DataCrawlerResponse>();
                #endregion

                #region Get html Nodes by Link
                List<HtmlNode> nodes = await GetHtmlNodes(url, tag, className);
                #endregion

                #region Get Data and Add To Model
                foreach (var node in nodes)
                {
                    if (node.Attributes["class"]?.Value == className)
                    {
                        DataCrawlerResponse data = new DataCrawlerResponse("Shabesh", "https://shabesh.com");

                        #region Title data
                        string title = node.Descendants("span").Where(d => d.Attributes["class"]?.Value == "list_infoItem__8EH57  ellipsis d-block global_colorBlue__jeWJ7").FirstOrDefault()?.InnerHtml;

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
                        var imageSrc = node.Descendants("img").ToList()[1]?.ChildAttributes("src").SingleOrDefault()?.Value.ToString();
                        if (!string.IsNullOrEmpty(imageSrc))
                            data.PictureLink = JsonConvertor.ToJson(imageSrc.ToString()).ClearedUrl();
                        else
                            data.PictureLink = "none";
                        #endregion

                        #region Rent data
                        var prices = node.Descendants("span").Where(d => d.Attributes["class"]?.Value == "list_infoItem__8EH57  list_infoPrice___aJXK d-block").ToList();
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

        #region Privates
        private async Task<List<HtmlNode>> GetHtmlNodes(Uri url, string tag, string className)
        {
            #region Request and Load Data
            var httpClient = new HttpClient();
            var html = await httpClient.GetStringAsync(url);

            var htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(html);
            #endregion

            #region Filter html Crawler by Tag and ClassName
            var nodes = htmlDocument.DocumentNode.Descendants(tag).Where(c => c.GetAttributeValue("class", "").Equals(className)).ToList();
            #endregion

            if (nodes.Any()) return nodes; else return null;
        }
        #endregion
    }
}