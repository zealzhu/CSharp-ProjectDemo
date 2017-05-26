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
            gvProduct.DataSource = bll.GetModelList("");
            gvProduct.DataBind();
        }

        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}