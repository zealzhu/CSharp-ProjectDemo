using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectDemo.OPPortal
{
    using ProjectDemo.Common;
    using ProjectDemo.BLL;
    using ProjectDemo.Model;
    public class BasePage : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (Session[Key.CURRENT_USER] == null)
            {
                //未登录
                //检查是否有cookie， 用于自动登录
                CheckCookie();
            }
        }
        /// <summary>
        /// 跳转到登录界面
        /// </summary>
        private void RedirectLoginPage()
        {
            Response.Write("<script>alert('你还未登录，请登录');window.location.href='/Login.aspx';</script>");
            Response.End();
        }
        /// <summary>
        /// 检查是否有cookic并进行自动登录
        /// </summary>
        private void CheckCookie()
        {
            //先获取cookie
            HttpCookie cookie = Request.Cookies[Key.USER_ID];
            if (cookie == null)
            {
                //没有cookie，返回登录界面
                RedirectLoginPage();
            }
            string userId = cookie.Value;
            if (string.IsNullOrWhiteSpace(userId))
            {
                //返回登录界面
                RedirectLoginPage();
            }
            //将用户名解密
            userId = CryptoHelper.TripleDES_Decrypt(userId, Key.COOKIE_KEY);
            //验证用户名格式
            if (string.IsNullOrWhiteSpace(userId) || !userId.IsNumber())
            {
                //返回登录界面
                RedirectLoginPage();
            }
            //通过验证
            UserInfoBLL userInfoBLL = new UserInfoBLL();
            ProjectDemo.Model.UserInfo userInfo = userInfoBLL.GetModel(Convert.ToInt32(userId));
            if (userInfo == null)
            {
                //找不到该用户，返回登录界面
                RedirectLoginPage();
            }
            //自动登录完毕，保存信息到Session
            Session[Key.CURRENT_USER] = userInfo;
        }
    }
}