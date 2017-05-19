using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.master
{
    using ProjectDemo.Common;
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected string realName;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectDemo.Model.UserInfo userInfo = (ProjectDemo.Model.UserInfo)Session[Key.CURRENT_USER];
            this.realName = userInfo.RealName;
        }
    }
}