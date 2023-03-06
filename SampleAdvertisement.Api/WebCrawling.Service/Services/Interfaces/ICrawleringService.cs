using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebCrawling.Models;

namespace WebCrawling.Services.Interfaces
{
    public interface ICrawleringService
    {
        Task<List<DivarDataResponse>> DivarCrawl(Uri url, string tag, string className);
     }
}
