using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace ProjectDemo.Common
{
    /// <summary>
    /// 脚本帮助类
    /// </summary>
    public class ScriptHelper
    {
        /// <summary>
        /// 弹窗提示
        /// </summary>
        /// <param name="msg"></param>
        public static void Alert(string msg)
        {
            ExecuteScript("alert('" + msg + "');");
        }

        /// <summary>
        /// 弹窗提示后刷新
        /// </summary>
        /// <param name="msg"></param>
        public static void AlertRefresh(string msg)
        {
            ExecuteScript("alert('" + msg + "');window.location.href=window.location.href;");
        }
        /// <summary>
        /// 弹窗提示后跳转
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="url"></param>
        public static void AlertRedirect(string msg, string url)
        {
            ExecuteScript("alert('" + msg + "');window.location.href='" + url + "';");
        }
        /// <summary>
        /// 弹窗提示后后退
        /// </summary>
        /// <param name="msg"></param>
        public static void AlertGoBack(string msg)
        {
            ExecuteScript("alert('" + msg + "');history.go(-1);");
        }
        /// <summary>
        /// 执行脚本
        /// </summary>
        /// <param name="script"></param>
        private static void ExecuteScript(string script)
        {
            Page currentPage = HttpContext.Current.Handler as Page;
            if (currentPage != null)
            {
                //RegisterStartupScript 会在</body>前执行
                //RegisterClientScriptBlock 在页面还没加载时执行
                currentPage.ClientScript.RegisterStartupScript(currentPage.GetType(), Guid.NewGuid().ToString(), script, true);
            }
            else
            {
                HttpContext.Current.Response.Write("<script>" + script + "</script>");
                HttpContext.Current.Response.End();
            }
        }
    }
}
