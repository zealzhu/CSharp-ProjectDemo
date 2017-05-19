using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectDemo.OPPortal.Ajax
{
    using ProjectDemo.BLL;
    using ProjectDemo.Common;
    using ProjectDemo.Model;
    /// <summary>
    /// SaveUserHandler 的摘要说明
    /// </summary>
    public class SaveUserHandler : BaseHandler
    {
        private UserInfoBLL bll = new UserInfoBLL();
        public override void SubProgressRequest()
        {
            //获取参数
            string strUserId = Context.Request.Form["UserId"];
            string strUsername = Context.Request.Form["Username"];
            string strPassword = Context.Request.Form["Password"];
            string strRealName = Context.Request.Form["RealName"];
            string strPhone = Context.Request.Form["Phone"];
            string strUserType = Context.Request.Form["UserType"];
            string strStatus = Context.Request.Form["UserStatus"];

            //非空验证
            UserInfo model = new UserInfo();
            model.UserId = !string.IsNullOrWhiteSpace(strUserId) ? Convert.ToInt32(strUserId) : 0;
            model.Username = !string.IsNullOrWhiteSpace(strUsername) ? strUsername : "";
            model.Password = !string.IsNullOrWhiteSpace(strPassword) ? strPassword.ToUpper() : "";
            model.RealName = !string.IsNullOrWhiteSpace(strRealName) ? strRealName : "";
            model.Phone = !string.IsNullOrWhiteSpace(strPhone) ? strPhone : "";
            model.UserType = !string.IsNullOrWhiteSpace(strUserType) ? Convert.ToInt32(strUserType) : 2;
            model.Status = !string.IsNullOrWhiteSpace(strStatus) ? Convert.ToInt32(strStatus) : 1;

            //判断用户名是否存在
            if (bll.IsExistsUsername(model.Username, model.UserId))
            {
                AjaxHelper.WriteErrorJson("用户名已存在");
            }

            //更新数据
            if (!bll.AddOrUpdate(model))
            {
                AjaxHelper.WriteErrorJson("保存失败");
            }
            else
            {
                AjaxHelper.WriteSuccessJson();
            }
            
        }
    }
}