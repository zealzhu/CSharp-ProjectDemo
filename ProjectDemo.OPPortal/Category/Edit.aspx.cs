﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo.OPPortal.Category
{
    using BLL;
    using Model;
    using Common;
    public partial class Edit : BasePage
    {
        private CategoryBLL bll = new CategoryBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            string categoryId = Request.QueryString["id"];  //尝试获取分类id
            if(string.IsNullOrWhiteSpace(categoryId))
            {
                //新增
                BindParentIdDropDownList();
            }
            else
            {
                //修改
                BindParentIdDropDownList(Convert.ToInt32(categoryId));
            }
        }

        //绑定父级列表的集合
        List<Category> bindParentIdList = new List<Category>();
        /// <summary>
        /// 绑定父级分类下拉框
        /// </summary>
        /// <param name="categoryId"></param>
        private void BindParentIdDropDownList(int categoryId = 0)
        {
            //获取指定字段的的列表
            List<Category> list = bll.GetModelList(fields: "CategoryId, Name, ParentId, SortIndex, HasChildren, Depth, IdPath", orderBy: "ParentId ASC, SortIndex ASC");
            if(categoryId > 0)
            {
                //如果是修改要排序自己与自己的所有子节点
                Category currentModel = list.SingleOrDefault(o => o.CategoryId == categoryId);
                if(currentModel != null)
                {
                    //删除列表中所有以该节点IdPath开头的节点，包括自己
                    list.RemoveAll(o => o.IdPath.StartsWith(currentModel.IdPath));
                }
            }

            List<Category> topCategory = list.FindAll(o => o.ParentId == 0);
            for (int i = 0; i < topCategory.Count; i++)
            {
                //从顶级节点开始遍历添加
                bindParentIdList.Add(new Category()
                {
                    CategoryId = topCategory[i].CategoryId,
                    Name = topCategory[i].Name
                });
                //递归添加子节点
                AddChildren(list, topCategory[i]);

                //绑定数据
                ddlParentId.DataSource = bindParentIdList;
                ddlParentId.DataTextField = "Name";
                ddlParentId.DataBind();
                
                ddlParentId.Items.Insert(0, "顶级分类");
            }
        }
        private void AddChildren(List<Category> list, Category root)
        {
            if(!Convert.ToBoolean(root.HasChildren))
            {
                //没有子节点则退出
                return;
            }
            //找出该父节点的子节点
            List<Category> childrenList = list.FindAll(o => o.ParentId == root.CategoryId);
            for (int i = 0; i < childrenList.Count; i++)
            {
                string str = string.Empty;
                //遍历深度添加前缀
                for (int j = 1; j < childrenList[i].Depth; j++)
                {
                    str += "--";
                }
                bindParentIdList.Add(new Category()
                {
                    CategoryId= childrenList[i].CategoryId,
                    Name=str + childrenList[i].Name
                });
                //继续查找子节点
                AddChildren(list, childrenList[i]);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}