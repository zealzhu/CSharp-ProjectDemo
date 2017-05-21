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
    using Common;
    public partial class EditContent : BasePage
    {
        protected string content = string.Empty;
        private CategoryBLL bll = new CategoryBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            string categoryId = Request.QueryString["id"];
            if(string.IsNullOrWhiteSpace(categoryId) || !categoryId.IsNumber())
            {
                ScriptHelper.Alert("参数不合法");
                return;
            }
            BindData(Convert.ToInt32(categoryId));           
        }

        private void BindData(int categoryId)
        {
            //设置content的值
            ViewState["CategoryId"] = categoryId;
            Category category = bll.GetModel(where:"CategoryId=" + categoryId, fields:"Name,CategoryId,Content");
            if(category == null)
            {
                return;
            }
            lblName.Text = category.Name;
            content = category.Content;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(ViewState["CategoryId"] == null)
            {
                throw new Exception("ID为NULL");
            }
            int categoryId = Convert.ToInt32(ViewState["CategoryId"]);
            string content = Request.Form["content"];           //获取内容
            Category category = new Category()
            {
                CategoryId = categoryId,
                Content = content
            };

            if(bll.Update(category, new string[] { "Content" }, "CategoryId=" + categoryId))
                ScriptHelper.AlertRedirect("修改成功", "/Category/List.aspx");
            else
                ScriptHelper.Alert("修改失败");
        }
    }
}