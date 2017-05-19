using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    using System.Reflection;
    /// <summary>
    /// 枚举帮助类
    /// </summary>
    public static class EnumHelper
    {
        /// <summary>
        /// 通过枚举值获取枚举的描述
        /// </summary>
        /// <typeparam name="T">自定义的枚举</typeparam>
        /// <param name="enumValue"></param>
        /// <returns></returns>
        public static string GetDescription<T>(this long enumValue)
        {
            if (!typeof(T).IsEnum)
            {
                //如果不是枚举的类型，则直接返回空
                return string.Empty;
            }
            //将枚举常数数字值的字符串表示转换成等效的枚举对象
            T t = (T)Enum.Parse(typeof(T), enumValue.ToString());

            return GetDescription(t as Enum);
        }
        private static string GetDescription(Enum e)
        {
            //枚举的描述
            string desc = string.Empty;
            //获取枚举Type
            Type type = e.GetType();
            //通过反射获取该字段
            FieldInfo fieldInfo = type.GetField(e.ToString());
            //判断该枚举字段是否有
            if (!fieldInfo.IsDefined(typeof(EnumDescriptionAttribute), false))
            {
                //该枚举不包含枚举字段
                return desc;
            }
            //获取该枚举的所有枚举字段
            Object[] objects = fieldInfo.GetCustomAttributes(typeof(EnumDescriptionAttribute), false);
            
            if (objects == null || objects.Length <= 0)
            {
                return desc;
            }
            //转换为枚举字段
            EnumDescriptionAttribute[] attributes = objects as EnumDescriptionAttribute[];
            foreach (EnumDescriptionAttribute item in attributes)
            {
                //拼接枚举字段
                desc += item.Desc + " | ";
            }
            //消除尾部的 | 
            desc = desc.TrimEnd(new Char[] {' ', '|', ' '});
            return desc;
        }
    }
}
