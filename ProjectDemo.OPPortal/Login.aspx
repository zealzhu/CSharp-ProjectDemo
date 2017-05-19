<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectDemo.OPPortal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- 导入Bootstrap所需源 -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/js/jquery-1.11.1.js" type="text/javascript"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="/js/md5.encrypt.js" type="text/javascript"></script>

    <!-- 登录样式表 -->
    <link href="/css/login.css" rel="stylesheet" />
    <!-- 登录脚本 -->
    <script type="text/javascript" src="/js/login.js"></script>
    
</head>
<body>
    <form id="formLogin" runat="server">
        <table>
            <tr>
                <th>用户名：</th>
                <td>
                    <input type="text" class="form-control" id="txtUid" />
                </td>
            </tr>
            <tr>
                <th>密码：</th>
                <td>
                    <input type="password" class="form-control" id="txtPwd" />
                </td>
            </tr>
            <tr>
                <th>验证码:</th>
                <td>
                    <input type="text" class="form-control" id="txtCaptcha" />
                    <img id="imgCaptcha" src="/Captcha/CaptchaHandler.ashx" title="单击刷新" />
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <input type="checkbox" id="chkAutoLogin" /><span>&nbsp;自动登录</span>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <input type="button" class="btn btn-primary" value="登录" id="btnLogin" onclick="login()" />
                    &nbsp;&nbsp;<span class="tip"></span>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
