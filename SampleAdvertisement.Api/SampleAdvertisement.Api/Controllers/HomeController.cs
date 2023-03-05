using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
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
        private readonly string _siteAddress;
        private readonly string _htmlTag;
        private readonly string _htmlClassName;

        public HomeController(IConfiguration config, ICrawleringService crawler)
        {
            _config = config;
            _crawler = crawler;
            _siteAddress = _config.GetValue<string>("CrawlingAddress:Divar:SiteAddress");
            _htmlTag = _config.GetValue<string>("CrawlingAddress:Divar:HtmlTag");
            _htmlClassName = _config.GetValue<string>("CrawlingAddress:Divar:HtmlClassName");
        }
        #endregion

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            try
            {
                Uri urlReq = new Uri(this._siteAddress);

                List<DivarDataResponse> result = await _crawler.DivarCrawl(urlReq, this._htmlTag, this._htmlClassName);


                return Ok(new { data = result, statusCode = 200 });
            }
            catch (Exception ex)
            {
                return Ok(new { data = "", statusCode = 500 });
            }
        }
    }
}