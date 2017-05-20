using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using ProjectDemo.DBUtility;//Please add references

namespace ProjectDemo.DAL
{
    using System.Collections.Generic;
    using Common;
	/// <summary>
	/// 数据访问类:CategoryDAL
	/// </summary>
	public partial class CategoryDAL : BaseDAL
	{
		public CategoryDAL()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("CategoryId", "Category"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int CategoryId)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Category");
			strSql.Append(" where CategoryId=@CategoryId");
			SqlParameter[] parameters = {
					new SqlParameter("@CategoryId", SqlDbType.Int,4)
			};
			parameters[0].Value = CategoryId;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(ProjectDemo.Model.Category model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Category(");
			strSql.Append("Name,Type,ParentId,Status,SortIndex,Url,Content,IdPath,Depth,HasChildren)");
			strSql.Append(" values (");
			strSql.Append("@Name,@Type,@ParentId,@Status,@SortIndex,@Url,@Content,@IdPath,@Depth,@HasChildren)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Name", SqlDbType.NVarChar,20),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@ParentId", SqlDbType.Int,4),
					new SqlParameter("@Status", SqlDbType.TinyInt,1),
					new SqlParameter("@SortIndex", SqlDbType.Int,4),
					new SqlParameter("@Url", SqlDbType.VarChar,100),
					new SqlParameter("@Content", SqlDbType.NVarChar,2000),
					new SqlParameter("@IdPath", SqlDbType.VarChar,100),
					new SqlParameter("@Depth", SqlDbType.Int,4),
					new SqlParameter("@HasChildren", SqlDbType.TinyInt,1)};
			parameters[0].Value = model.Name;
			parameters[1].Value = model.Type;
			parameters[2].Value = model.ParentId;
			parameters[3].Value = model.Status;
			parameters[4].Value = model.SortIndex;
			parameters[5].Value = model.Url;
			parameters[6].Value = model.Content;
			parameters[7].Value = model.IdPath;
			parameters[8].Value = model.Depth;
			parameters[9].Value = model.HasChildren;

			object obj = DbHelperSQL.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(ProjectDemo.Model.Category model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Category set ");
			strSql.Append("Name=@Name,");
			strSql.Append("Type=@Type,");
			strSql.Append("ParentId=@ParentId,");
			strSql.Append("Status=@Status,");
			strSql.Append("SortIndex=@SortIndex,");
			strSql.Append("Url=@Url,");
			strSql.Append("Content=@Content,");
			strSql.Append("IdPath=@IdPath,");
			strSql.Append("Depth=@Depth,");
			strSql.Append("HasChildren=@HasChildren");
			strSql.Append(" where CategoryId=@CategoryId");
			SqlParameter[] parameters = {
					new SqlParameter("@Name", SqlDbType.NVarChar,20),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@ParentId", SqlDbType.Int,4),
					new SqlParameter("@Status", SqlDbType.TinyInt,1),
					new SqlParameter("@SortIndex", SqlDbType.Int,4),
					new SqlParameter("@Url", SqlDbType.VarChar,100),
					new SqlParameter("@Content", SqlDbType.NVarChar,2000),
					new SqlParameter("@IdPath", SqlDbType.VarChar,100),
					new SqlParameter("@Depth", SqlDbType.Int,4),
					new SqlParameter("@HasChildren", SqlDbType.TinyInt,1),
					new SqlParameter("@CategoryId", SqlDbType.Int,4)};
			parameters[0].Value = model.Name;
			parameters[1].Value = model.Type;
			parameters[2].Value = model.ParentId;
			parameters[3].Value = model.Status;
			parameters[4].Value = model.SortIndex;
			parameters[5].Value = model.Url;
			parameters[6].Value = model.Content;
			parameters[7].Value = model.IdPath;
			parameters[8].Value = model.Depth;
			parameters[9].Value = model.HasChildren;
			parameters[10].Value = model.CategoryId;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int CategoryId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Category ");
			strSql.Append(" where CategoryId=@CategoryId");
			SqlParameter[] parameters = {
					new SqlParameter("@CategoryId", SqlDbType.Int,4)
			};
			parameters[0].Value = CategoryId;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string CategoryIdlist )
		{
            StringBuilder strSql = new StringBuilder();
			strSql.Append("delete from Category ");
			strSql.Append(" where CategoryId in ("+CategoryIdlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ProjectDemo.Model.Category GetModel(int CategoryId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 CategoryId,Name,Type,ParentId,Status,SortIndex,Url,Content,IdPath,Depth,HasChildren from Category ");
			strSql.Append(" where CategoryId=@CategoryId");
			SqlParameter[] parameters = {
					new SqlParameter("@CategoryId", SqlDbType.Int,4)
			};
			parameters[0].Value = CategoryId;

			ProjectDemo.Model.Category model=new ProjectDemo.Model.Category();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public ProjectDemo.Model.Category DataRowToModel(DataRow row)
		{
			ProjectDemo.Model.Category model=new ProjectDemo.Model.Category();
			if (row != null)
			{
				if(row["CategoryId"]!=null && row["CategoryId"].ToString()!="")
				{
					model.CategoryId=int.Parse(row["CategoryId"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["Type"]!=null && row["Type"].ToString()!="")
				{
					model.Type=int.Parse(row["Type"].ToString());
				}
				if(row["ParentId"]!=null && row["ParentId"].ToString()!="")
				{
					model.ParentId=int.Parse(row["ParentId"].ToString());
				}
				if(row["Status"]!=null && row["Status"].ToString()!="")
				{
					model.Status=int.Parse(row["Status"].ToString());
				}
				if(row["SortIndex"]!=null && row["SortIndex"].ToString()!="")
				{
					model.SortIndex=int.Parse(row["SortIndex"].ToString());
				}
				if(row["Url"]!=null)
				{
					model.Url=row["Url"].ToString();
				}
				if(row["Content"]!=null)
				{
					model.Content=row["Content"].ToString();
				}
				if(row["IdPath"]!=null)
				{
					model.IdPath=row["IdPath"].ToString();
				}
				if(row["Depth"]!=null && row["Depth"].ToString()!="")
				{
					model.Depth=int.Parse(row["Depth"].ToString());
				}
				if(row["HasChildren"]!=null && row["HasChildren"].ToString()!="")
				{
					model.HasChildren=int.Parse(row["HasChildren"].ToString());
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select CategoryId,Name,Type,ParentId,Status,SortIndex,Url,Content,IdPath,Depth,HasChildren ");
			strSql.Append(" FROM Category ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" CategoryId,Name,Type,ParentId,Status,SortIndex,Url,Content,IdPath,Depth,HasChildren ");
			strSql.Append(" FROM Category ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM Category ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.CategoryId desc");
			}
			strSql.Append(")AS Row, T.*  from Category T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}
		#endregion  BasicMethod
		#region  ExtensionMethod

        /// <summary>
        /// 获取指定字段列表
        /// </summary>
        /// <param name="field"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        public List<Model.Category> GetListData(string field, string where)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append("select " + field + " from Category");
            if(!string.IsNullOrWhiteSpace(where.Trim()))
                sql.Append(" where " + where);
            List<Model.Category> list = new List<Model.Category>();
            using (SqlDataReader sdr = DBUtility.DbHelperSQL.ExecuteReader(sql.ToString()))
            {
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        list.Add(DataReaderToModel(sdr));
                    }
                }
            }
            return list;
        }
        /// <summary>
        /// 将SqlDataReader转换为Model
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        public ProjectDemo.Model.Category DataReaderToModel(SqlDataReader reader)
        {
            ProjectDemo.Model.Category model = new ProjectDemo.Model.Category();
            if (reader.IsContainsColumn("CategoryId"))  //reader["CategoryId"]!=null  错误的
            {
                model.CategoryId = Convert.ToInt32(reader["CategoryId"]);
            }
            if (reader.IsContainsColumn("Name"))
            {
                model.Name = reader["Name"].ToString();
            }
            if (reader.IsContainsColumn("Type"))
            {
                model.Type = Convert.ToInt32(reader["Type"]);
            }
            if (reader.IsContainsColumn("ParentId"))
            {
                model.ParentId = Convert.ToInt32(reader["ParentId"]);
            }
            if (reader.IsContainsColumn("Status"))
            {
                model.Status = Convert.ToInt32(reader["Status"]);
            }
            if (reader.IsContainsColumn("SortIndex"))
            {
                model.SortIndex = Convert.ToInt32(reader["SortIndex"]);
            }
            if (reader.IsContainsColumn("Url"))
            {
                model.Url = reader["Url"].ToString();
            }
            if (reader.IsContainsColumn("Content"))
            {
                model.Content = reader["Content"].ToString();
            }
            if (reader.IsContainsColumn("IdPath"))
            {
                model.IdPath = reader["IdPath"].ToString();
            }
            if (reader.IsContainsColumn("Depth"))
            {
                model.Depth = Convert.ToInt32(reader["Depth"]);
            }
            if (reader.IsContainsColumn("HasChildren"))
            {
                model.HasChildren = Convert.ToInt32(reader["HasChildren"]);
            }
            return model;
        }

        /// <summary>
        /// 根据where条件删除
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public int Delete(string where)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("delete from Category ");
            if(!string.IsNullOrWhiteSpace(where))
            {
                sb.Append("where" + where);
            }
            return DbHelperSQL.ExecuteSql(sb.ToString());            
        }

        /// <summary>
        /// 更新是否有子节点
        /// </summary>
        /// <param name="categoryId"></param>
        /// <param name="hasChildren"></param>
        /// <returns></returns>
        public int UpdateHasChildren(int categoryId, bool hasChildren)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("update Category ");
            sb.Append("set HasChildren=" + Convert.ToInt32(hasChildren));//true 1
            sb.Append(" where CategoryId=" + categoryId);
            return DbHelperSQL.ExecuteSql(sb.ToString());
        }

        /// <summary>
        /// 根据指定字段，条件获取Model List
        /// </summary>
        /// <param name="fields"></param>
        /// <param name="where"></param>
        /// <param name="orderBy"></param>
        /// <returns></returns>
        public List<Model.Category> GetModelList(string fields, string where, string orderBy)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select " + fields);
            sb.Append(" from Category ");
            sb.Append("where " + where);
            if(!string.IsNullOrWhiteSpace(orderBy))
            {
                sb.Append(" order by " + orderBy);
            }
            List<Model.Category> list = new List<Model.Category>();
            using(SqlDataReader reader = DbHelperSQL.ExecuteReader(sb.ToString()))
            {
                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        Model.Category category = DataReaderToModel(reader);
                        list.Add(category);
                    }
                }
            }
            return list;
        }
		#endregion  ExtensionMethod
	}
}

