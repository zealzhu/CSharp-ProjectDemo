using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    /// <summary>
    /// Ajax对象
    /// </summary>
    public class AjaxObject
    {
        /// <summary>
        /// 状态
        /// </summary>
        public AjaxStatusEnum Status { get; set; }
        /// <summary>
        /// 错误消息
        /// </summary>
        public string Msg { get; set; }
        /// <summary>
        /// 附加数据
        /// </summary>
        public object Data { get; set; }
        public AjaxObject()
        {
            this.Status = 0;
            this.Msg = string.Empty;
            this.Data = null;
        }
    }
}
