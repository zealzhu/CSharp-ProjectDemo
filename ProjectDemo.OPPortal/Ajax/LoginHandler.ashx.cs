using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectDemo.OPPortal.ajax
{
    using ProjectDemo.Common;
    using ProjectDemo.BLL;
    using ProjectDemo.Model;
    /// <summary>
    /// LoginHandler 的摘要说明
    /// </summary>
    public class LoginHandler : IHttpHandler,System.Web.SessionState.IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
            //接收参数
            string txtUid = context.Request.Form["UserName"];
            string txtPwd = context.Request.Form["Password"];
            string txtCaptcha = context.Request.Form["Captcha"];
            string txtIsAutoLogin = context.Request.Form["IsAutoLogin"];

            //非空验证
            string msg = "";
            if (!CheckParameter(txtUid, txtPwd, txtCaptcha, out msg))
            {
                //有空项
                AjaxHelper.WriteErrorJson(msg);
            }

            //验证验证码
            string sessionCaptcha = context.Session[Key.CAPTCHA].ToString();
            if (sessionCaptcha.ToLower() != txtCaptcha.ToLower())       
            {
                //验证码错误
                AjaxHelper.WriteErrorJson("验证码错误");
            }

            //账户是否存在
            UserInfoBLL userInfoBLL = new UserInfoBLL();
            UserInfo userInfo = userInfoBLL.GetModelByUserName(txtUid);
            if (userInfo == null)
            {
                //不存在该账户
                AjaxHelper.WriteErrorJson("不存在该账户");
            }

            //账户是否被禁用
            if (userInfo.Status == (int)UserStatus.Disable)
            {
                //禁用
                AjaxHelper.WriteErrorJson("账户被禁用");
            }

            //密码是否正确
            if (userInfo.Password != txtPwd)
            {
                //密码错误
                AjaxHelper.WriteErrorJson("密码错误");
            }

            //登录成功，保存用户信息到Session中
            context.Session[Key.CURRENT_USER] = userInfo;

            //判断是否勾选自动登录
            if (!string.IsNullOrWhiteSpace(txtIsAutoLogin) && txtIsAutoLogin.ToLower() == "true")
            {
                //勾选了自动登录，生成cookie
                GenerateCookie(userInfo);
            }
            AjaxHelper.WriteSuccessJson();
        }

        /// <summary>
        /// 生成cookie
        /// </summary>
        /// <param name="userInfo"></param>
        private void GenerateCookie(UserInfo userInfo)
        {
            HttpCookie cookie = new HttpCookie(Key.USER_ID);
            //将用户名加密放入cookie中
            cookie.Value = CryptoHelper.TripleDES_Encrypt(userInfo.UserId.ToString(), Key.COOKIE_KEY);
            //设置cookie过期时间
            cookie.Expires = DateTime.Now.AddDays(1);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        /// <summary>
        /// 检查字段自否为空
        /// </summary>
        /// <param name="txtUid"></param>
        /// <param name="txtPwd"></param>
        /// <param name="txtCaptcha"></param>
        /// <param name="msg"></param>
        /// <returns></returns>
        public bool CheckParameter(string txtUid, string txtPwd, string txtCaptcha, out string msg)
        {
            bool flag = true;
            msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtUid))
            {
                msg = "请输入用户名";
                flag = false;
            }
            if (string.IsNullOrWhiteSpace(txtPwd))
            {
                msg = "请输入密码";
                flag = false;
            }
            if (string.IsNullOrWhiteSpace(txtCaptcha))
            {
                msg = "请输入验证码";
                flag = false;
            }
            return flag;
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