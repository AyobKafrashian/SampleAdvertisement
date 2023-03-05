using System;

namespace WebCrawling.Models
{
    public class DivarDataResponse
    {
        public DivarDataResponse(string refrence = "Divar", string urlLink = "https://divar.ir")
        {
            this.Refrence = refrence;
            this.UrlLink = new Uri(urlLink);
        }

        public Uri UrlLink { get; set; }
        public string Refrence { get; set; }
        public string PictureLink { get; set; }
        public string Title { get; set; }
        public string Rent { get; set; }
    }
}