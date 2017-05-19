using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectDemo.OPPortal
{
    using ProjectDemo.BLL;
    using ProjectDemo.Common;
    using ProjectDemo.Model;
    /// <summary>
    /// BaseHandler 的摘要说明
    /// </summary>
    public abstract class BaseHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //检查是否登录
            CheckLogin();
            //执行子类的ProcessRequest
            SubProgressRequest();
        }

        public HttpContext Context {
            get
            {
                return HttpContext.Current;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        //要求子类必须重写的方法，只能存在于抽象类中
        public abstract void SubProgressRequest();

        /// <summary>
        /// 检查是否登录
        /// </summary>
        private void CheckLogin()
        {
            if (HttpContext.Current.Session[Key.CURRENT_USER] == null)
            {
                //未登录
                //检查是否有cookie， 用于自动登录
                CheckCookie();
            }
        }
        /// <summary>
        /// 检查是否有cookic并进行自动登录
        /// </summary>
        private void CheckCookie()
        {
            //先获取cookie
            HttpCookie cookie = HttpContext.Current.Request.Cookies[Key.USER_ID];
            //判断是否过期
            if (cookie == null)
            {
                //提示未登录
                AjaxHelper.WriteNoLoginJson();
            }
            string userId = cookie.Value;
            if (string.IsNullOrWhiteSpace(userId))
            {
                //提示未登录
                AjaxHelper.WriteNoLoginJson();
            }
            //将用户名解密
            userId = CryptoHelper.TripleDES_Decrypt(userId, Key.COOKIE_KEY);
            //验证用户名格式
            if (string.IsNullOrWhiteSpace(userId) || !userId.IsNumber())
            {
                //提示未登录
                AjaxHelper.WriteNoLoginJson();
            }
            //通过验证
            UserInfoBLL userInfoBLL = new UserInfoBLL();
            ProjectDemo.Model.UserInfo userInfo = userInfoBLL.GetModel(Convert.ToInt32(userId));
            if (userInfo == null)
            {
                //提示未登录
                AjaxHelper.WriteNoLoginJson();
            }
            //自动登录完毕，保存信息到Session
            HttpContext.Current.Session[Key.CURRENT_USER] = userInfo;
        }
    }
}