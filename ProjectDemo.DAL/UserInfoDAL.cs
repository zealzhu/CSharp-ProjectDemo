using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using ProjectDemo.DBUtility;//Please add references
using ProjectDemo.Common;
using System.Collections.Generic;

namespace ProjectDemo.DAL
{
	/// <summary>
	/// 数据访问类:UserInfoDAL
	/// </summary>
	public partial class UserInfoDAL
	{
		public UserInfoDAL()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("UserId", "UserInfo"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int UserId)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from UserInfo");
			strSql.Append(" where UserId=@UserId");
			SqlParameter[] parameters = {
					new SqlParameter("@UserId", SqlDbType.Int,4)
			};
			parameters[0].Value = UserId;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(ProjectDemo.Model.UserInfo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into UserInfo(");
			strSql.Append("Username,Password,RealName,Phone,UserType,Status,CreateDate)");
			strSql.Append(" values (");
			strSql.Append("@Username,@Password,@RealName,@Phone,@UserType,@Status,@CreateDate)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Username", SqlDbType.VarChar,16),
					new SqlParameter("@Password", SqlDbType.Char,32),
					new SqlParameter("@RealName", SqlDbType.NVarChar,10),
					new SqlParameter("@Phone", SqlDbType.VarChar,15),
					new SqlParameter("@UserType", SqlDbType.TinyInt,1),
					new SqlParameter("@Status", SqlDbType.TinyInt,1),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
			parameters[0].Value = model.Username;
			parameters[1].Value = model.Password;
			parameters[2].Value = model.RealName;
			parameters[3].Value = model.Phone;
			parameters[4].Value = model.UserType;
			parameters[5].Value = model.Status;
			parameters[6].Value = model.CreateDate;

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
		public bool Update(ProjectDemo.Model.UserInfo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update UserInfo set ");
			strSql.Append("Username=@Username,");
			strSql.Append("Password=@Password,");
			strSql.Append("RealName=@RealName,");
			strSql.Append("Phone=@Phone,");
			strSql.Append("UserType=@UserType,");
			strSql.Append("Status=@Status,");
            strSql.Append("CreateDate=@CreateDate,");
			strSql.Append(" where UserId=@UserId");
			SqlParameter[] parameters = {
					new SqlParameter("@Username", SqlDbType.VarChar,16),
					new SqlParameter("@Password", SqlDbType.Char,32),
					new SqlParameter("@RealName", SqlDbType.NVarChar,10),
					new SqlParameter("@Phone", SqlDbType.VarChar,15),
					new SqlParameter("@UserType", SqlDbType.TinyInt,1),
					new SqlParameter("@Status", SqlDbType.TinyInt,1),
                    new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@UserId", SqlDbType.Int,4)};
			parameters[0].Value = model.Username;
			parameters[1].Value = model.Password;
			parameters[2].Value = model.RealName;
			parameters[3].Value = model.Phone;
			parameters[4].Value = model.UserType;
			parameters[5].Value = model.Status;
            parameters[6].Value = model.CreateDate;
			parameters[7].Value = model.UserId;

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
		public bool Delete(int UserId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from UserInfo ");
			strSql.Append(" where UserId=@UserId");
			SqlParameter[] parameters = {
					new SqlParameter("@UserId", SqlDbType.Int,4)
			};
			parameters[0].Value = UserId;

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
		public bool DeleteList(string UserIdlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from UserInfo ");
			strSql.Append(" where UserId in ("+UserIdlist + ")  ");
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
		public ProjectDemo.Model.UserInfo GetModel(int UserId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 UserId,Username,Password,RealName,Phone,UserType,Status,CreateDate from UserInfo ");
			strSql.Append(" where UserId=@UserId");
			SqlParameter[] parameters = {
					new SqlParameter("@UserId", SqlDbType.Int,4)
			};
			parameters[0].Value = UserId;

			ProjectDemo.Model.UserInfo model=new ProjectDemo.Model.UserInfo();
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
		public ProjectDemo.Model.UserInfo DataRowToModel(DataRow row)
		{
			ProjectDemo.Model.UserInfo model=new ProjectDemo.Model.UserInfo();
			if (row != null)
			{
				if(row["UserId"]!=null && row["UserId"].ToString()!="")
				{
					model.UserId=int.Parse(row["UserId"].ToString());
				}
				if(row["Username"]!=null)
				{
					model.Username=row["Username"].ToString();
				}
				if(row["Password"]!=null)
				{
					model.Password=row["Password"].ToString();
				}
				if(row["RealName"]!=null)
				{
					model.RealName=row["RealName"].ToString();
				}
				if(row["Phone"]!=null)
				{
					model.Phone=row["Phone"].ToString();
				}
				if(row["UserType"]!=null && row["UserType"].ToString()!="")
				{
					model.UserType=int.Parse(row["UserType"].ToString());
				}
				if(row["Status"]!=null && row["Status"].ToString()!="")
				{
					model.Status=int.Parse(row["Status"].ToString());
				}
				if(row["CreateDate"]!=null && row["CreateDate"].ToString()!="")
				{
					model.CreateDate=DateTime.Parse(row["CreateDate"].ToString());
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
			strSql.Append("select UserId,Username,Password,RealName,Phone,UserType,Status,CreateDate ");
			strSql.Append(" FROM UserInfo ");
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
			strSql.Append(" UserId,Username,Password,RealName,Phone,UserType,Status,CreateDate ");
			strSql.Append(" FROM UserInfo ");
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
			strSql.Append("select count(1) FROM UserInfo ");
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
				strSql.Append("order by T.UserId desc");
			}
			strSql.Append(")AS Row, T.*  from UserInfo T ");
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

        public object IsExistsUsername(string userName, int userId)
        {
            string sql = @"select COUNT(*)
                from UserInfo
                where Username=@Username and UserId!=@UserId";

            SqlParameter[] ps =
            {
                new SqlParameter("@Username",userName),     
                new SqlParameter("@UserId",userId),
            };

            return DbHelperSQL.GetSingle(sql, ps);
        }

        /// <summary>
        /// 更新用户信息，可选择是否修改密码
        /// </summary>
        /// <param name="model"></param>
        /// <param name="isUpdatePassword"></param>
        /// <returns></returns>
        public bool Update(ProjectDemo.Model.UserInfo model, bool isUpdatePassword)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update UserInfo set ");
            strSql.Append("Username=@Username,");
            //strSql.Append("Password=@Password,");
            if (isUpdatePassword)
            {
                strSql.Append("Password=@Password,");
            }
            strSql.Append("RealName=@RealName,");
            strSql.Append("Phone=@Phone,");
            strSql.Append("UserType=@UserType,");
            strSql.Append("Status=@Status");
            strSql.Append(" where UserId=@UserId");
            SqlParameter[] parameters = {
					new SqlParameter("@Username", SqlDbType.VarChar,16),
					//new SqlParameter("@Password", SqlDbType.Char,32),
					new SqlParameter("@RealName", SqlDbType.NVarChar,10),
					new SqlParameter("@Phone", SqlDbType.VarChar,15),
					new SqlParameter("@UserType", SqlDbType.TinyInt,1),
					new SqlParameter("@Status", SqlDbType.TinyInt,1),
					new SqlParameter("@UserId", SqlDbType.Int,4)};
            parameters[0].Value = model.Username;
            //parameters[1].Value = model.Password;
            parameters[1].Value = model.RealName;
            parameters[2].Value = model.Phone;
            parameters[3].Value = model.UserType;
            parameters[4].Value = model.Status;
            parameters[5].Value = model.UserId;

            SqlParameter[] newPs = null;
            if (isUpdatePassword)
            {
                //如果有修改密码，则添加密码的参数化查询
                newPs = new SqlParameter[parameters.Length + 1];
                parameters.CopyTo(newPs, 0);
                newPs[newPs.Length - 1] = new SqlParameter("@Password", SqlDbType.Char, 32);
                newPs[newPs.Length - 1].Value = model.Password;
            }

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), isUpdatePassword ? newPs : parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Model.UserInfo> GetList(string fields, string strWhere)
        {
            List<Model.UserInfo> list = new List<Model.UserInfo>();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select " + fields);
            strSql.Append(" FROM UserInfo ");
            strSql.Append(" where " + strWhere);
            SqlDataReader reader = DbHelperSQL.ExecuteReader(strSql.ToString());
            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    list.Add(DataReaderToModel(reader));
                }
            }
            return list;
        }
        /// <summary>
        /// 将DataReader转换为Model
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        public ProjectDemo.Model.UserInfo DataReaderToModel(SqlDataReader reader)
        {
            ProjectDemo.Model.UserInfo model = new ProjectDemo.Model.UserInfo();
            if (reader.IsContainsColumn("UserId"))  //reader["CategoryId"]!=null  错误的
            {
                model.UserId = Convert.ToInt32(reader["UserId"]);
            }
            if (reader.IsContainsColumn("Username"))
            {
                model.Username = reader["Username"].ToString();
            }
            if (reader.IsContainsColumn("Password"))
            {
                model.Password = reader["Password"].ToString();
            }
            if (reader.IsContainsColumn("RealName"))
            {
                model.RealName = reader["RealName"].ToString();
            }
            if (reader.IsContainsColumn("Phone"))
            {
                model.Phone = reader["Phone"].ToString();
            }
            if (reader.IsContainsColumn("UserType"))
            {
                model.UserType = Convert.ToInt32(reader["UserType"]);
            }
            if (reader.IsContainsColumn("Status"))
            {
                model.Status = Convert.ToInt32(reader["Status"]);
            }
            if (reader.IsContainsColumn("CreateDate"))
            {
                model.CreateDate = Convert.ToDateTime(reader["Content"]);
            }
           
            return model;
        }
        #endregion  ExtensionMethod
    }
}

