namespace WebCrawling.Convertor
{
   public static class StringCleared
    {
        public static string ClearedUrl(this string url)
        {
           return url.Replace("\"", "").TrimEnd('/');
        }
    }
}