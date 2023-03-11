using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SampleAdvertisement.Api.Settings;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebCrawling.Models;
using WebCrawling.Services.Interfaces;

namespace SampleAdvertisement.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        #region Constructor
        private readonly IConfiguration _config;
        private readonly ICrawleringService _crawler;
        private readonly CrawlingDivarSettings _settingDivarUrls;
        private readonly CrawlingKilidSettings _settingKilidUrls;
        private readonly CrawlingShabeshSettings _settingShabeshUrls;

        public HomeController(IConfiguration config, ICrawleringService crawler)
        {
            _config = config;
            _crawler = crawler;

            var crawlingDivarSettings = new CrawlingDivarSettings();
            _config.GetSection("CrawlingAddress:Divar").Bind(crawlingDivarSettings);
            _settingDivarUrls = crawlingDivarSettings;

            var crawlingKilidSettings = new CrawlingKilidSettings();
            _config.GetSection("CrawlingAddress:Kilid").Bind(crawlingKilidSettings);
            _settingKilidUrls = crawlingKilidSettings;

            var crawlingShabeshSettings = new CrawlingShabeshSettings();
            _config.GetSection("CrawlingAddress:Shabesh").Bind(crawlingShabeshSettings);
            _settingShabeshUrls = crawlingShabeshSettings;
        }
        #endregion

        [HttpGet]
        public async Task<IActionResult> Index(string? s)
        {
            try
            {
                if (s != null)
                    this._settingDivarUrls.SiteAddress += $"?q={s}";

                Uri urlDivarReq = new Uri(this._settingDivarUrls.SiteAddress);

                List<DataCrawlerResponse> result = await _crawler.DivarSiteCrawl(urlDivarReq, this._settingDivarUrls.HtmlTag, this._settingDivarUrls.HtmlClassName);

                return Ok(new { data = result, statusCode = 200 });
            }
            catch (Exception ex)
            {
                return Ok(new { data = "", statusCode = 500 });
            }
        }

        [HttpGet("GetKilidData")]
        public async Task<IActionResult> GetKilidData()
        {
            try
            {
                Uri urlKilidReq = new Uri(this._settingKilidUrls.SiteAddress);
                List<DataCrawlerResponse> result = await _crawler.KilidSiteCrawl(urlKilidReq, this._settingKilidUrls.HtmlTag, this._settingKilidUrls.HtmlClassName);

                return Ok(new { data = result, statusCode = 200 });
            }
            catch (Exception ex)
            {
                return Ok(new { data = "", statusCode = 500 });
            }
        }

        [HttpGet("GetShabeshData")]
        public async Task<IActionResult> GetShabeshData()
        {
            try
            {
                Uri urlShabeshReq = new Uri(this._settingShabeshUrls.SiteAddress);
                List<DataCrawlerResponse> result = await _crawler.ShabeshSiteCrawl(urlShabeshReq, this._settingShabeshUrls.HtmlTag, this._settingShabeshUrls.HtmlClassName);

                return Ok(new { data = result, statusCode = 200 });
            }
            catch (Exception ex)
            {
                return Ok(new { data = "", statusCode = 500 });
            }
        }
    }
}