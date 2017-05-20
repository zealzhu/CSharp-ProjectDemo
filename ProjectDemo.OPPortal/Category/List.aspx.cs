using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.Category
{
    using Model;
    using BLL;
    using ProjectDemo.Common;

    public partial class List : BasePage
    {
        private CategoryBLL bll = new CategoryBLL();
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
            int pageIndex = anpCategory.CurrentPageIndex;
            int pageSize = anpCategory.PageSize;
            int recordCount;
            List<Category> list = bll.GetPagingData("ParentId asc, SortIndex asc", out recordCount, pageIndex, pageSize, fields: "CategoryId,Name,Type,ParentId,Status,SortIndex");
            gvCategory.DataSource = list;
            gvCategory.DataBind();
            //设置数据总数
            anpCategory.RecordCount = recordCount;
        }

        protected void anpCategory_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            //切换当前显示页码
            anpCategory.CurrentPageIndex = e.NewPageIndex;
            //重新加载数据
            BindData();
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                //不是行数据绑定return
                return;
            }
            Label lblTypeId = e.Row.FindControl("lblTypeId") as Label;
            HyperLink hlContentOperate = e.Row.FindControl("hlContentOperate") as HyperLink;

            if (Convert.ToInt32(lblTypeId.Text) == (int)CategoryType.ContentPage)
            {
                //如果是内容页则显示操作内容页
                hlContentOperate.Visible = true;
            }         
        }

        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "del":
                    Delete(Convert.ToInt32(e.CommandArgument));
                    break;
            }
        }

        private void Delete(int id)
        {
            if (bll.Delete(bll.GetModel(id))) {
                ScriptHelper.AlertRefresh("删除成功");
            }
            else
            {
                ScriptHelper.AlertRefresh("删除失败");
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Category/Edit.aspx");
        }
    }
}