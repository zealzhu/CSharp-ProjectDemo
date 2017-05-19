using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.UserInfo
{
    using ProjectDemo.BLL;
    using ProjectDemo.Model;
    using ProjectDemo.Common;

    public partial class Edit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //绑定列表
                BindUserStatus();
                BindUserType();

                //判断是否修改还是新增
                string userId = Request.QueryString["id"];
                if (!string.IsNullOrWhiteSpace(userId) && userId.IsNumber())
                {
                    BindData(Convert.ToInt32(userId));
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        private void BindUserType()
        {
            //绑定下拉列表
            ddlUserType.Items.Add(new ListItem("系统管理员", "1"));
            ddlUserType.Items.Add(new ListItem("网站管理员", "2"));
            //设置默认值
            ddlUserType.SelectedValue = "2";
        }

        private void BindUserStatus()
        {
            //水平显示
            rblUserStatus.RepeatDirection = RepeatDirection.Horizontal;
            //绑定启动禁用
            rblUserStatus.Items.Add(new ListItem("禁用", "0"));
            rblUserStatus.Items.Add(new ListItem("启动", "1"));
            //设置默认值
            rblUserStatus.SelectedValue = "1";
        }

        /// <summary>
        /// 绑定用户数据
        /// </summary>
        /// <param name="userId"></param>
        private void BindData(int userId)
        {
            //从数据库中读取数据
            UserInfoBLL bll = new UserInfoBLL();
            UserInfo userInfo = bll.GetModel(userId);

            //数据为空返回
            if (userInfo == null)
                return;

            //绑定数据
            txtUserId.Value = userId.ToString();
            txtUserName.Text = userInfo.Username;
            txtRealName.Text = userInfo.RealName;
            txtPhone.Text = userInfo.Phone;
            //password类型不能够直接修改Text值
            txtPassword.Attributes["value"] = "******";
            rblUserStatus.SelectedValue = userInfo.Status.ToString();
            ddlUserType.SelectedValue = userInfo.UserType.ToString();
        }
    }
}