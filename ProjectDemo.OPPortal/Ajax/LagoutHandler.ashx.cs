using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectDemo.OPPortal
{
    using ProjectDemo.Common;
    /// <summary>
    /// LagoutHandler 的摘要说明
    /// </summary>
    public class LagoutHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            if(context.Session[Key.CURRENT_USER] == null) {
                //如果Session没有信息则直接跳转到登录界面
                context.Response.Redirect("/Login.aspx");
            }
            //清空session
            context.Session.Clear();
            //清除cookie
            HttpCookie cookie = context.Request.Cookies[Key.USER_ID];
            cookie.Expires = DateTime.Now.AddDays(-1);
            context.Response.Cookies.Add(cookie);

            //跳转到登录界面
            context.Response.Redirect("/Login.aspx");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}