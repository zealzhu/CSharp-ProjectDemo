using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    /// <summary>
    /// 枚举描述类
    /// </summary>
    public class EnumDescriptionAttribute : Attribute
    {
        /// <summary>
        /// 枚举的描述
        /// </summary>
        public string Desc { get; set; }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="desc"></param>
        public EnumDescriptionAttribute(string desc)
        {
            this.Desc = desc;
        }
    }
}
