using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.Product
{
    using Model;
    using BLL;
    using Common;
    using System.IO;

    public partial class Edit : BasePage
    {
        private ProductBLL bll = new ProductBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (IsPostBack)
                return;

            string id = Request.QueryString["id"];
            if (string.IsNullOrWhiteSpace(id))
            {
                //新增
                BindCategoryDropDownList();
            }
            else
            {
                //修改
                if (!id.IsNumber())
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
            String where = "Type=" + (int)CategoryType.ProductList;
            CategoryBLL categoryBll = new CategoryBLL();
            List<Category> categoryList = categoryBll.GetModelList(fields: "CategoryId, Name", where: where);
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataSource = categoryList;
            ddlCategory.DataBind();
        }

        public void BindOldData(int id)
        {
            Product model = bll.GetModel(id);
            ddlCategory.SelectedValue = model.CategoryId.ToString();
            txtName.Text = model.Name;
            txtBrand.Text = model.Brand;
            txtType.Text = model.Type;
            txtDescription.Text = model.Description;
            txtSortIndex.Text = model.SortIndex.ToString();
            ViewState["OldModel"] = model;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Model.UserInfo userInfo = (UserInfo)Session[Key.CURRENT_USER];
            Product model = new Product();
            model.Name = txtName.Text;
            model.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            model.Brand = txtBrand.Text;
            model.Type = txtType.Text;
            model.Description = txtDescription.Text;
            model.ImgUrl = hfImageUrl.Value;
            model.ThumbUrl = hfThumbUrl.Value;
            model.Status = Convert.ToInt32(rdblStatus.SelectedValue);
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
                Product oldModel = (Product)ViewState["OldModel"];
                model.ProductId = oldModel.ProductId;
                model.CreateDate = oldModel.CreateDate;
                model.CreateUserId = oldModel.CreateUserId;
                model.Content = oldModel.Content;           //内容未添加
                model.Click = oldModel.Click;
                bll.Update(model);
                ScriptHelper.AlertRedirect("修改成功", "/Product/List.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (!fuProductUrl.HasFile)
            {
                //没有上传文件
                ScriptHelper.Alert("请先选择图片");
                return;
            }
            //生成新的文件名,随机名+后缀
            string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuProductUrl.FileName);
            //拼接网站的虚拟路径
            string virtualPath = "/upload/" + fileName;
            //获取真实路径
            string realPath = Server.MapPath(virtualPath);      //原图上传路径
            using (System.Drawing.Image img = System.Drawing.Image.FromStream(fuProductUrl.PostedFile.InputStream)) //加载原图
            using (System.Drawing.Image thumb = img.GetThumbnailImage(143, 143, null, System.IntPtr.Zero))          //生成缩略图
            {
                string thumbPath = Server.MapPath("/upload/thumbnail/" + fileName);//缩略图的保存路径
                thumb.Save(thumbPath);
            }
            //保存原图
            fuProductUrl.SaveAs(realPath);
            ScriptHelper.Alert("上传成功");
            //显示图片
            imgProduct.ImageUrl = virtualPath;
            //验证
            hfImageUrl.Value = virtualPath;
            hfThumbUrl.Value = "/upload/thumbnail/" + fileName;
        }
    }
}