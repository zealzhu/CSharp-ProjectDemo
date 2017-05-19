using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProjectDemo.Common
{
    public class Key
    {
        /// <summary>
        /// 验证码
        /// </summary>
        public const string CAPTCHA = "CAPTCHA"; //const = static readonly

        /// <summary>
        /// 当前登录成功的用户,用于Session
        /// </summary>
        public const string CURRENT_USER = "CURRENT_USER";

        /// <summary>
        /// cookie中的用户id
        /// </summary>
        public const string USER_ID = "USER_ID";

        /// <summary>
        /// COOKIE加密串
        /// </summary>
        public const string COOKIE_KEY = "e6fkYUINNREcTFUl";
    }
}
