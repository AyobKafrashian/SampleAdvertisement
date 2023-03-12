using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebCrawling.Models;

namespace WebCrawling.Services.Interfaces
{
    public interface ICrawleringService
    {
        Task<List<DataCrawlerResponse>> DivarSiteCrawl(Uri url, string tag, string className);
        Task<List<DataCrawlerResponse>> KilidSiteCrawl(Uri url, string tag, string className);
        Task<List<DataCrawlerResponse>> ShabeshSiteCrawl(Uri url, string tag, string className);
     }
}
