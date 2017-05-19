using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.UserInfo
{
    using ProjectDemo.Model;
    using ProjectDemo.BLL;
    using ProjectDemo.Common;
    using System.Text;
    
    public partial class List : BasePage
    {
        private UserInfoBLL bll = new UserInfoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //第一次加载页面绑定数据
                BindData();
            }
        }
        private void BindData()
        {
            //设置数据源
            repUserInfoList.DataSource = bll.GetModelList("");
            //绑定
            repUserInfoList.DataBind();
        }

        /// <summary>
        /// 每行绑定数据时调用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void repUserInfoList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) //AlternatingItem间隔行
            {
                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
                //获取状态值
                string statusValue = lblStatus.Text;
                //获取枚举类型
                UserStatus userStatus = (UserStatus)Enum.Parse(typeof(UserStatus), statusValue);

                //获取状态枚举值
                statusValue = Convert.ToInt64(statusValue).GetDescription<UserStatus>();
                lblStatus.Text = statusValue;

                //更改颜色
                switch (userStatus)
                {
                    case UserStatus.Disable:
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        break;
                    case UserStatus.Enable:
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        break;
                    default:
                        break;
                }
            }
        }

        protected void repUserInfoList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Del":
                    int userId = Convert.ToInt32(e.CommandArgument);
                    DeleteUserInfo(userId);
                    break;
                default:
                    break;
            }
        }

        private void DeleteUserInfo(int userId)
        {
            if (bll.Delete(userId))
            {
                ScriptHelper.AlertRefresh("删除成功");
            }
            else
            {
                ScriptHelper.AlertRefresh("删除失败");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string userId = txtUserId.Text.Trim();
            string userName = txtUserName.Text.Trim();
            string userType = ddlType.SelectedValue;
            string beginTime = txtTimeBegin.Value;
            string endTime = txtTimeEnd.Value;

            //拼接where语句
            StringBuilder sb = new StringBuilder();
            sb.Append("1=1");//注意
            if (!string.IsNullOrWhiteSpace(userId) && userId.IsNumber())
            {
                sb.Append(" and UserId=" + userId);
            }
            if (!string.IsNullOrWhiteSpace(userName))
            {
                sb.Append(" and Username like '%" + userName + "%'");
            }
            if (Convert.ToInt32(userType) != -1)
            {
                sb.Append(" and UserType=" + userType);
            }
            if (!string.IsNullOrWhiteSpace(beginTime))
            {
                sb.Append(" and CreateDate>='" + beginTime + "'");
            }
            if (!string.IsNullOrWhiteSpace(endTime))
            {
                sb.Append(" and CreateDate<='" + endTime + "'");
            }

            //重新获取数据绑定
            repUserInfoList.DataSource = bll.GetModelList(sb.ToString());
            repUserInfoList.DataBind();
        }
    }
}