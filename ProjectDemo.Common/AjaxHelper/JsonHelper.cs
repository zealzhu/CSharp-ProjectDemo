using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    using Newtonsoft.Json;
    public class JsonHelper
    {
        /// <summary>
        /// 序列化,将对象转换为json格式
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string Serialize(object obj)
        {
            return JsonConvert.SerializeObject(obj);
        }

        /// <summary>
        /// 反序列化
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="json"></param>
        /// <returns></returns>
        public static T Deserialize<T>(string json)
            where T : class, new()
        {
            object obj = JsonConvert.DeserializeObject(json, typeof(T));
            return obj as  T;
        }
    }
}
