using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ProjectDemo.Common
{
    /// <summary>
    /// Ajax帮助类
    /// </summary>
    public class AjaxHelper
    {
        /// <summary>
        /// 输出JSON
        /// </summary>
        private static void WriteJson(AjaxStatusEnum status, string msg = "", object data = null)
        {
            AjaxObject ajaxObject = new AjaxObject()
            {
                Status = status,
                Msg = msg,
                Data = data
            };
            HttpContext.Current.Response.Write(JsonHelper.Serialize(ajaxObject));
            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// 输出成功json
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="data"></param>
        public static void WriteSuccessJson(string msg = "", object data = null)
        {
            WriteJson(AjaxStatusEnum.Success, msg, data);
        }
        /// <summary>
        /// 输出成功json
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="data"></param>
        public static void WriteErrorJson(string msg, object data = null)
        {
            WriteJson(AjaxStatusEnum.Error, msg, data);
        }
        /// <summary>
        /// 输出未登录json
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="data"></param>
        public static void WriteNoLoginJson()
        {
            WriteJson(AjaxStatusEnum.NoLogin, "你还未登录", null);
        }
    }
}
