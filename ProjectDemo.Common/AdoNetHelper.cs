using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    public static class AdoNetHelper
    {
        public static bool IsContainsColumn(this SqlDataReader reader, String columnName)
        {
            return reader.GetSchemaTable().Select("ColumnName='" + columnName + "'").Length > 0;
        }
    }
}
