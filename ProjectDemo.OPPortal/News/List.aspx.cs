using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.News
{
    using BLL;
    using Common;
    using Model;
    public partial class List : BasePage
    {
        private NewsBLL bll = new NewsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            BindData();
        }
        private void BindData()
        {
            String where = "Type=" + (int)CategoryType.NewsList;
            CategoryBLL categoryBll = new CategoryBLL();
            List<Category> categoryList = categoryBll.GetModelList(fields: "CategoryId, Name", where: where);
            List<News> newsList = bll.GetModelList("");
            List<UserInfo> userInfoList = new UserInfoBLL().GetModelList(fields: "UserId, Username");

            foreach (News item in newsList)
            {
                //设置标题名字
                item.CategoryName = categoryList.Find(o => o.CategoryId == item.CategoryId).Name;
                //设置创建用户名
                item.CreateUserName = userInfoList.Find(o => o.UserId == item.CreateUserId).Username;
                //设置更新用户名
                item.UpdateUserName = userInfoList.Find(o => o.UserId == item.UpdateUserId).Username;
            }
            gvNews.DataSource = newsList;
            gvNews.DataBind();
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/News/Edit.aspx");
        }

        protected void gvNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "del":
                    Delete((int)e.CommandArgument);
                    break;
                default:
                    break;
            }
        }

        private void Delete(int id)
        {
            if (bll.Delete(id))
            {
                ScriptHelper.AlertRefresh("删除成功");
            }
            else
            {
                ScriptHelper.AlertRefresh("删除失败");
            }
        }
    }
}