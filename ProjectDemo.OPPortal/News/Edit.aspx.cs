using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.News
{
    using Model;
    using Common;
    using BLL;
    public partial class Edit : BasePage
    {
        private NewsBLL bll = new NewsBLL();
        protected string contentValue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            string id = Request.QueryString["id"];
            if(string.IsNullOrWhiteSpace(id))
            {
                //新增
                BindCategoryDropDownList();
            }
            else
            {
                //修改
                if(!id.IsNumber())
                {
                    ScriptHelper.AlertRedirect("id参数不正确", "/News/List.aspx");
                    return;                
                }
                BindCategoryDropDownList();
                BindOldData(Convert.ToInt32(id));
            }

        }

        private void BindCategoryDropDownList()
        {
            String where = "Type=" + (int)CategoryType.NewsList;
            CategoryBLL categoryBll = new CategoryBLL();
            List<Category> categoryList = categoryBll.GetModelList(fields: "CategoryId, Name", where: where);
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataSource = categoryList;
            ddlCategory.DataBind();
        }

        public void BindOldData(int id)
        {
            News model = bll.GetModel(id);
            ddlCategory.SelectedValue = model.CategoryId.ToString();
            txtTitle.Text = model.Title;
            rdblStatus.SelectedValue = model.Status.ToString();
            contentValue = model.Content;
            ViewState["OldModel"] = model;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Model.UserInfo userInfo = (UserInfo)Session[Key.CURRENT_USER];
            News model = new News();
            model.Title = txtTitle.Text;
            model.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            model.Status = Convert.ToInt32(rdblStatus.SelectedValue);
            model.Content = hfContent.Value;
            model.UpdateDate = DateTime.Now;
            model.UpdateUserId = userInfo.UserId;

            if (ViewState["OldModel"] == null)
            {
                //新增                
                model.CreateDate = DateTime.Now;                               
                model.CreateUserId = userInfo.UserId;
                model.Click = 0;
                bll.Add(model);
                ScriptHelper.AlertRedirect("添加成功", "/News/List.aspx");
            }
            else
            {
                //修改
                News oldModel = (News)ViewState["OldModel"];
                model.NewsId = oldModel.NewsId;
                model.CreateDate = oldModel.CreateDate;
                model.CreateUserId = oldModel.CreateUserId;
                model.Click = oldModel.Click;
                bll.Update(model);
                ScriptHelper.AlertRedirect("修改成功", "/News/List.aspx");
            }         
        }
    }
}