using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.Product
{
    using Model;
    using Common;
    using BLL;
    public partial class List : BasePage
    {
        private ProductBLL bll = new ProductBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            BindData();
        }

        private void BindData()
        {
            String where = "Type=" + (int)CategoryType.ProductList;
            CategoryBLL categoryBll = new CategoryBLL();
            List<Category> categoryList = categoryBll.GetModelList(fields: "CategoryId, Name", where: where);
            List<Product> productList = bll.GetModelList("");
            List<UserInfo> userInfoList = new UserInfoBLL().GetModelList(fields: "UserId, Username");

            foreach (Product item in productList)
            {
                //设置标题名字
                item.CategoryName = categoryList.Find(o => o.CategoryId == item.CategoryId).Name;
                //设置创建用户名
                item.CreateUserName = userInfoList.Find(o => o.UserId == item.CreateUserId).Username;
                //设置更新用户名
                item.UpdateUserName = userInfoList.Find(o => o.UserId == item.UpdateUserId).Username;
            }
            gvProduct.DataSource = productList;
            gvProduct.DataBind();
        }

        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Product/Edit.aspx");
        }
    }
}