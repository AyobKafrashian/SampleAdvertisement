using Newtonsoft.Json;
using System;

namespace WebCrawling.Convertor
{
   public class JsonConvertor
    {
        public static string ToJson(string req)
        {
            try
            {
                return JsonConvert.SerializeObject(req);
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error converting object to JSON: {e.Message}");
                return null;
            }
        }
    }
}