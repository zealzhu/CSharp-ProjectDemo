using System;
using System.Data;
using System.Collections.Generic;
using ProjectDemo.Model;

namespace ProjectDemo.BLL
{
	/// <summary>
	/// 用户信息
	/// </summary>
	public partial class UserInfoBLL
	{
		private readonly ProjectDemo.DAL.UserInfoDAL dal=new ProjectDemo.DAL.UserInfoDAL();
		public UserInfoBLL()
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
		public bool Exists(int UserId)
		{
			return dal.Exists(UserId);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(ProjectDemo.Model.UserInfo model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(ProjectDemo.Model.UserInfo model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int UserId)
		{
			
			return dal.Delete(UserId);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string UserIdlist )
		{
			return dal.DeleteList(ProjectDemo.Common.PageValidate.SafeLongFilter(UserIdlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ProjectDemo.Model.UserInfo GetModel(int UserId)
		{
			
			return dal.GetModel(UserId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public ProjectDemo.Model.UserInfo GetModelByCache(int UserId)
		{
			
			string CacheKey = "UserInfoModel-" + UserId;
			object objModel = ProjectDemo.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(UserId);
					if (objModel != null)
					{
						int ModelCache = ProjectDemo.Common.ConfigHelper.GetConfigInt("ModelCache");
						ProjectDemo.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (ProjectDemo.Model.UserInfo)objModel;
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
		public List<ProjectDemo.Model.UserInfo> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ProjectDemo.Model.UserInfo> DataTableToList(DataTable dt)
		{
			List<ProjectDemo.Model.UserInfo> modelList = new List<ProjectDemo.Model.UserInfo>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				ProjectDemo.Model.UserInfo model;
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

        public UserInfo GetModelByUserName(string userName)
        {
            string where = " Username='" + userName + "'";
            DataSet ds = this.GetList(where);
            if (ds == null || ds.Tables[0].Rows.Count <= 0)
            {
                return null;
            }
            return dal.DataRowToModel(ds.Tables[0].Rows[0]);
        }

        public List<UserInfo> GetModelList(string fields = "*", string strWhere = "1=1")
        {
            return dal.GetList(fields, strWhere);
        }

        /// <summary>
        /// 用户名是否存在
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public bool IsExistsUsername(string userName, int userId)
        {
            object obj = dal.IsExistsUsername(userName, userId);
            if (Convert.ToInt32(obj) > 0)
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 更新或添加数据
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        public bool AddOrUpdate(UserInfo userInfo)
        {
            if (userInfo.UserId > 0)
            {
                return dal.Update(userInfo, 
                    !String.IsNullOrWhiteSpace(userInfo.Password));//为空表示不修改密码
            }
            else
            {
                return Add(userInfo) > 0;
            }
        }

		#endregion  ExtensionMethod
	}
}

