using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ProjectDemo.Common
{
    /// <summary>
    /// ���ܰ�����
    /// </summary>
    public class CryptoHelper
    {
        #region MD5����
        /// <summary>
        /// ��׼MD5����
        /// </summary>
        /// <param name="source">�������ַ���</param>
        /// <param name="addKey">�����ַ���</param>
        /// <param name="encoding">���뷽ʽ</param>
        /// <returns>string</returns>
        public static string MD5_Encrypt(string source, string addKey, Encoding encoding)
        {
            if (addKey.Length > 0)
            {
                source = source + addKey;
            }

            MD5 MD5 = new MD5CryptoServiceProvider();
            byte[] datSource = encoding.GetBytes(source);
            byte[] newSource = MD5.ComputeHash(datSource);
            string byte2String = null;
            for (int i = 0; i < newSource.Length; i++)
            {
                string thisByte = newSource[i].ToString("x");
                if (thisByte.Length == 1) thisByte = "0" + thisByte;
                byte2String += thisByte;
            }

            return byte2String;
        }

        /// <summary>
        /// ��׼MD5����
        /// </summary>
        /// <param name="source">�������ַ���</param>
        /// <param name="encoding">���뷽ʽ</param>
        /// <returns></returns>
        public static string MD5_Encrypt(string source, string encoding)
        {
            return MD5_Encrypt(source, string.Empty, Encoding.GetEncoding(encoding));
        }

        /// <summary>
        /// ��׼MD5����
        /// </summary>
        /// <param name="source">�����ܵ��ַ���</param>
        /// <returns></returns>
        public static string MD5_Encrypt(string source)
        {
            return MD5_Encrypt(source, string.Empty, Encoding.Default);
        }
        #endregion

        //�ԳƼ����㷨
        //AES  DES  3DES

        #region 3DES�ӽ���
        /// <summary>
        /// 3DES����
        /// </summary>
        /// <param name="source">�������ַ�</param>
        /// <param name="key">��Կ</param>
        /// <returns>string</returns>
        public static string TripleDES_Encrypt(string source, string key)
        {
            TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider();
            DES.Key = ASCIIEncoding.ASCII.GetBytes(key);
            DES.Mode = CipherMode.ECB;
            ICryptoTransform DESEncrypt = DES.CreateEncryptor();
            byte[] Buffer = ASCIIEncoding.ASCII.GetBytes(source);

            return Convert.ToBase64String(DESEncrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
        }

        /// <summary>
        /// 3DES����
        /// </summary>
        /// <param name="source">�������ַ�</param>
        /// <param name="key">��Կ</param>
        /// <param name="encoding">���뷽ʽ</param>
        /// <returns>string</returns>
        public static string TripleDES_Encrypt(string source, string key, string encoding)
        {
            TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider();
            DES.Key = System.Text.Encoding.GetEncoding(encoding).GetBytes(key);
            DES.Mode = CipherMode.ECB;
            ICryptoTransform DESEncrypt = DES.CreateEncryptor();
            byte[] Buffer = System.Text.Encoding.GetEncoding(encoding).GetBytes(source);

            return Convert.ToBase64String(DESEncrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
        }

        /// <summary>
        /// 3DES����
        /// </summary>
        /// <param name="source">�������ַ�</param>
        /// <param name="key">��Կ</param>
        /// <returns>string</returns>
        public static string TripleDES_Decrypt(string source, string key)
        {
            TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider();
            DES.Key = ASCIIEncoding.ASCII.GetBytes(key);
            DES.Mode = CipherMode.ECB;
            DES.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            ICryptoTransform DESDecrypt = DES.CreateDecryptor();
            string result = "";
            try
            {
                byte[] Buffer = Convert.FromBase64String(source);
                result = ASCIIEncoding.ASCII.GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
            }
            catch (Exception e)
            {
                //
            }

            return result;
        }

        /// <summary>
        /// 3DES����
        /// </summary>
        /// <param name="source">�������ַ�</param>
        /// <param name="key">��Կ</param>
        /// <param name="encoding">���뷽ʽ</param>
        /// <returns>string</returns>
        public static string TripleDES_Decrypt(string source, string key, string encoding)
        {
            TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider();
            DES.Key = System.Text.Encoding.GetEncoding(encoding).GetBytes(key);
            DES.Mode = CipherMode.ECB;
            DES.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            ICryptoTransform DESDecrypt = DES.CreateDecryptor();
            string result = "";
            try
            {
                byte[] Buffer = Convert.FromBase64String(source);
                result = System.Text.Encoding.GetEncoding(encoding).GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
            }
            catch (Exception e)
            {
                //
            }

            return result;
        }

        #endregion
    }
}
