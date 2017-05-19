<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ProjectDemo.OPPortal.UserInfo.Edit" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <%--将普通的HTML元素改成ASP.NET服务端控件  加上runat="server"--%>
    <input type="hidden" value="" runat="server" id="txtUserId" />

    <table>
        <tr>
            <th>用户名:</th>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*用户名必填" ForeColor="Red" 
                    ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>密码:</th>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*密码必填" ForeColor="Red" 
                    ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>真实姓名:</th>
            <td>
                <asp:TextBox ID="txtRealName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>手机:</th>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>用户类型:</th>
            <td>
                <asp:DropDownList ID="ddlUserType" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>用户状态:</th>
            <td>
                <asp:RadioButtonList ID="rblUserStatus" runat="server"></asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <%--使用asp控件会进行页面的刷新,填写的数据会丢失，所以不使用asp控件--%>
                <input type="button" onclick="saveUser()" value="保存" />
                <asp:Button ID="btnCancle" runat="server" Text="取消" OnClientClick="javascript:history.go(-1);"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="/js/md5.encrypt.js"></script>
    <script type="text/javascript">
        //保存用户信息
        function saveUser() {
            //Asp.net会生成一个Page_ClientValidate()的js方法用来判断验证是否通过
            if (!Page_ClientValidate()) {
                return false;//验证不通过
            }
            //封装数据
            var postData = {
                UserId: $('#txtUserId').val(),
                UserName: $('#txtUserName').val(),
                Password: '',
                RealName: $('#txtRealName').val(),
                Phone: $('#txtPhone').val(),
                UserType: $('#ddlUserType').val(),
                UserStatus: $(':radio[name="ctl00$right$rblStatus"]:checked').val(),    //Asp.net会生成name="ctl00$right$rblStatus"的radio，找到checked的
            };
            //判断是否修改了密码
            var pwd = $('#txtPassword').val();
            if (pwd != '' && pwd != '******') {
                //表示修改过密码
                postData.Password = hex_md5(pwd).toUpperCase();//MD5加密并转换为大写
            }
            //发送ajax请求
            $.ajax({
                url: '/Ajax/SaveUserHandler.ashx',
                type: 'post',
                dataType: 'json',
                data: postData,
                success: function (obj) {
                    if (obj.Status == 0) {
                        alert('保存成功');
                        location.href = "/UserInfo/List.aspx";
                    } else {
                        alert(obj.Msg);
                    }
                },
            });
        }
    </script>
</asp:Content>
