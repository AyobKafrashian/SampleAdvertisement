using Microsoft.Extensions.Configuration;

namespace SampleAdvertisement.Api.Settings
{
    public class CrawlingDivarSettings
    {
        public string SiteAddress { get; set; }
        public string HtmlTag { get; set; }
        public string HtmlClassName { get; set; }
    }
    public class CrawlingKilidSettings
    {
        public string SiteAddress { get; set; }
        public string HtmlTag { get; set; }
        public string HtmlClassName { get; set; }
    }
    public class CrawlingShabeshSettings
    {
        public string SiteAddress { get; set; }
        public string HtmlTag { get; set; }
        public string HtmlClassName { get; set; }
    }
}