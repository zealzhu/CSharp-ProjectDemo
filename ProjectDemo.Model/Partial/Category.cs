using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Model
{
    public partial class Category
    {
        private string parentName = string.Empty;
        public string ParentName
        {
            get
            {
                return parentName;
            }
            set
            {
                this.parentName = value;
            }
        }
    }
}
