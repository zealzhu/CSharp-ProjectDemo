using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.Config
{
    using Common;
    using System.IO;
    public partial class Edit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (!fuAboutImgUrl.HasFile)
            {
                //没有上传文件
                ScriptHelper.Alert("请先选择图片");
                return;
            }
            //生成新的文件名,随机名+后缀
            string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuAboutImgUrl.FileName);
            //拼接网站的虚拟路径
            string virtualPath = "/upload/" + fileName;
            //获取真实路径
            string realPath = Server.MapPath(virtualPath);
            //保存
            fuAboutImgUrl.SaveAs(realPath);
            ScriptHelper.Alert("上传成功");
            //显示图片
            imgAbout.ImageUrl = virtualPath;
            //验证
            txtAboutImgUrl.Text = virtualPath;
        }
    }
}