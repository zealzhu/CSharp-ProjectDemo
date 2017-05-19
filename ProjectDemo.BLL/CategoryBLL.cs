using System;
using System.Data;
using System.Collections.Generic;
using ProjectDemo.Model;
using System.Data.SqlClient;
using System.Linq;

namespace ProjectDemo.BLL
{
	/// <summary>
	/// 分类
	/// </summary>
	public partial class CategoryBLL
	{
		private readonly ProjectDemo.DAL.CategoryDAL dal=new ProjectDemo.DAL.CategoryDAL();
		public CategoryBLL()
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
		public bool Exists(int CategoryId)
		{
			return dal.Exists(CategoryId);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(ProjectDemo.Model.Category model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(ProjectDemo.Model.Category model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int CategoryId)
		{
			
			return dal.Delete(CategoryId);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string CategoryIdlist )
		{
			return dal.DeleteList(ProjectDemo.Common.PageValidate.SafeLongFilter(CategoryIdlist,0) );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ProjectDemo.Model.Category GetModel(int CategoryId)
		{
			
			return dal.GetModel(CategoryId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public ProjectDemo.Model.Category GetModelByCache(int CategoryId)
		{
			
			string CacheKey = "CategoryModel-" + CategoryId;
			object objModel = ProjectDemo.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(CategoryId);
					if (objModel != null)
					{
						int ModelCache = ProjectDemo.Common.ConfigHelper.GetConfigInt("ModelCache");
						ProjectDemo.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (ProjectDemo.Model.Category)objModel;
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
		public List<ProjectDemo.Model.Category> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<ProjectDemo.Model.Category> DataTableToList(DataTable dt)
		{
			List<ProjectDemo.Model.Category> modelList = new List<ProjectDemo.Model.Category>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				ProjectDemo.Model.Category model;
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
        /// <summary>
        /// 获取分页数据列表
        /// </summary>
        /// <param name="orderBy">排序</param>
        /// <param name="count">记录总数</param>
        /// <param name="pageIndex">第几页</param>
        /// <param name="pageSize">每页大小</param>
        /// <param name="where">条件</param>
        /// <param name="fields">字段</param>
        /// <returns></returns>
        public List<Category> GetPagingData(string orderBy, out int count, int pageIndex = 1, int pageSize = 10, string where = "1=1", string fields = "*")
        {
            SqlParameter total = null;
            //所有类别的集合
            List<Category> list = new List<Category>();
            using (SqlDataReader sdr = dal.GetPagingData(pageIndex, pageSize, "Category", where, fields, orderBy, ref total))
            {
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        Category category = dal.DataReaderToModel(sdr);
                        list.Add(category);
                    }
                }
            }
            //释放SqlDataReader后获取到记录总数
            count = Convert.ToInt32(total.Value);
            //根据父分类ID获取设置父分类名
            List<int> parentsId = list.Select(o => o.ParentId).ToList();
            int[] parentsIdArr = parentsId.ToArray();
            //拼接父分类id（1，2，3，4，5）
            string parentIds = string.Join(",", parentsIdArr);
            string strWhere = "CategoryId in(" + parentIds + ")";
            //获取父分类名集合
            List<Category> parentName = dal.GetListData("CategoryId, Name", strWhere);
            foreach (Category item in list)
            {
                if (item.ParentId == 0)
                {
                    item.ParentName = "顶级分类";
                    continue;
                }
                //如果没有数据会返回null
                Category parent = parentName.SingleOrDefault(o => o.CategoryId == item.ParentId);
                if (parent != null)
                {
                    item.ParentName = parent.Name;
                }
            }
            return list;
        }
		#endregion  ExtensionMethod
	}
}

