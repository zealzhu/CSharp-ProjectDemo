using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Model
{
    using ProjectDemo.Common;
    public enum UserStatus
    {
        /// <summary>
        /// 禁用
        /// </summary>
        [EnumDescriptionAttribute("禁用")]
        Disable = 0,
        /// <summary>
        /// 启用
        /// </summary>
        [EnumDescription("启用")]
        Enable = 1,
    }

    /// <summary>
    /// 用户类型
    /// </summary>
    public enum UserType
    {
        /// <summary>
        /// 系统管理员
        /// </summary>
        [EnumDescription("系统管理员")]
        Admin = 1,
        /// <summary>
        /// 网站管理员
        /// </summary>
        [EnumDescription("网站管理员")]
        Website = 2,
    }
    /// <summary>
    /// 不显示与显示
    /// </summary>
    public enum ShowOrHide
    {
        /// <summary>
        /// 不显示
        /// </summary>
        [EnumDescription("不显示")]
        Hide = 0,
        /// <summary>
        /// 显示
        /// </summary>
        [EnumDescription("显示")]
        Show = 1,
    }
    /// <summary>
    /// 分类类型
    /// </summary>
    public enum CategoryType
    {
        /// <summary>
        /// 链接
        /// </summary>
        [EnumDescription("链接")]
        Link = 1,
        /// <summary>
        /// 内容页
        /// </summary>
        [EnumDescription("内容页")]
        ContentPage = 2,
        /// <summary>
        /// 新闻列表
        /// </summary>
        [EnumDescription("新闻列表")]
        NewsList = 3,
        /// <summary>
        /// 产品列表
        /// </summary>
        [EnumDescription("产品列表")]
        ProductList = 4,
    }
}
