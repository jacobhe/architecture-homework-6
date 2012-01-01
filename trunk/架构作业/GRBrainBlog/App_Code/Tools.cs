using System;
using System.Text;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Web;
using System.Collections.Generic;
using System.Security.Cryptography;
//工具类
public class Tools
{
    public Tools()
    {
    }
    // 得到加密字符串
    //strText:要加密字符串;strEncrKey:密钥;返回：加密后字符串
    public static string Encrypt(string strText, string strEncrKey)//加密函数
    {
        byte[] byKey = null;//初始化密钥
        byte[] IV = { 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF, 0x11, 0x12 };
        try
        {
            byKey = System.Text.Encoding.UTF8.GetBytes(strEncrKey);//获取密钥
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(strText);//输入的字符串转化成字节型
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);//输出加密流
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        catch (System.Exception error)
        {
            return "error:" + error.Message + "\r";
        }
    }
}
