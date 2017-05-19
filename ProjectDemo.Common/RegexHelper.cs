using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace ProjectDemo.Common
{
    /// <summary>
    /// 正则帮助类
    /// </summary>
    public static class RegexHelper
    {
        /// <summary>
        /// 验证是否纯数字
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsNumber(this string str)
        {
            Regex reg = new Regex(@"\d+");
            return reg.IsMatch(str);
        }
    }
}
