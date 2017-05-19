﻿using System;
using System.Data;
using System.Collections.Generic;
using ProjectDemo.Model;

namespace ProjectDemo.BLL
{
	/// <summary>
	/// 留言
	/// </summary>
	public partial class FeedbackBLL
	{
		private readonly ProjectDemo.DAL.FeedbackDAL dal=new ProjectDemo.DAL.FeedbackDAL();
		public FeedbackBLL()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int MsgId)
		{
			return dal.Exists(MsgId);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(ProjectDemo.Model.Feedback model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(ProjectDemo.Model.Feedback model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int MsgId)
		{
			
			return dal.Delete(MsgId);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string MsgIdlist )
		{
			return dal.DeleteList(ProjectDemo.Common.PageValidate.SafeLongFilter(MsgIdlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ProjectDemo.Model.Feedback GetModel(int MsgId)
		{
			
			return dal.GetModel(MsgId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public ProjectDemo.Model.Feedback GetModelByCache(int MsgId)
		{
			
			string CacheKey = "FeedbackModel-" + MsgId;
			object objModel = ProjectDemo.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(MsgId);
					if (objModel != null)
					{
						int ModelCache = ProjectDemo.Common.ConfigHelper.GetConfigInt("ModelCache");
						ProjectDemo.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (ProjectDemo.Model.Feedback)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ProjectDemo.Model.Feedback> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ProjectDemo.Model.Feedback> DataTableToList(DataTable dt)
		{
			List<ProjectDemo.Model.Feedback> modelList = new List<ProjectDemo.Model.Feedback>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				ProjectDemo.Model.Feedback model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

