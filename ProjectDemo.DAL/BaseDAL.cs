using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace ProjectDemo.DAL
{
    using ProjectDemo.Common;
    public abstract class BaseDAL
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pageIndex">第几页</param>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="tableName">表</param>
        /// <param name="where">条件</param>
        /// <param name="fields">字段列表</param>
        /// <param name="orderBy">排序</param>
        /// <param name="total">总记录数</param>
        /// <returns></returns>
        public SqlDataReader GetPagingData(int pageIndex, int pageSize, string tableName, string where, string fields, string orderBy, ref SqlParameter total)
        {
            //@PageIndex int=1,--第几页
            //@PageSize int=100,--每页记录数
            //@Table nvarchar(20),--表
            //@Where nvarchar(500)='1=1',--条件
            //@Fields nvarchar(500)='*',--字段列表
            //@OrderBy nvarchar(500),--排序	
            //@Total int output--总记录数

            SqlParameter[] ps =
            {
                new SqlParameter("@PageIndex", SqlDbType.Int),
                new SqlParameter("@PageSize", SqlDbType.Int),
                new SqlParameter("@Table", SqlDbType.NVarChar, 20),
                new SqlParameter("@Where", SqlDbType.NVarChar, 500),
                new SqlParameter("@Fields", SqlDbType.NVarChar, 500),
                new SqlParameter("@OrderBy", SqlDbType.NVarChar, 500),
                new SqlParameter("@Total", SqlDbType.Int),
            };
            ps[0].Value = pageIndex;
            ps[1].Value = pageSize;
            ps[2].Value = tableName;
            ps[3].Value = where;
            ps[4].Value = fields;
            ps[5].Value = orderBy;
            ps[6].Direction = ParameterDirection.Output;//设置output参数
            SqlDataReader sdr = DBUtility.DbHelperSQL.ExecuteDataReaderByProduce("proc_Pager", ps);
            //输出参数只有在sdr释放时会有值，因此这里ps[6]为null，还不能转换
            total = ps[6];

            return sdr;
        }

        
    }
}
