<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ProjectDemo.OPPortal.UserInfo.List"  ClientIDMode="Static"%>

<%@ import Namespace="ProjectDemo.Common"%>
<%@ import Namespace="ProjectDemo.Model"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/My97DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">

    <div>
        用户编号：<asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        用户名：<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        用户类型：<asp:DropDownList ID="ddlType" runat="server">
                <asp:ListItem Selected="True" Value="-1">--全部--</asp:ListItem>
                <asp:ListItem Value="1">系统管理员</asp:ListItem>
                <asp:ListItem Value="2">网站管理员</asp:ListItem>
             </asp:DropDownList>
        <br />
        创建时间：<input type="text" id="txtTimeBegin" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server" />
        &nbsp;至&nbsp;
        <input type="text" id="txtTimeEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server" />
        &nbsp;&nbsp;
        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="查询" OnClick="btnSearch_Click"/>
        <br />
        <input type="button" class="btn btn-primary" onclick="javascript: location.href = '/UserInfo/Edit.aspx'" value="新增" />
    </div>

    <table class="table table-condensed">
        <tr>
            <th>用户编号</th>
            <th>用户名</th>
            <th>真实姓名</th>
            <th>手机</th>
            <th>用户类型</th>
            <th>状态</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        <asp:Repeater ID="repUserInfoList" runat="server" OnItemCommand="repUserInfoList_ItemCommand" OnItemDataBound="repUserInfoList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("UserId")%></td>
                    <td><%#Eval("Username")%></td>
                    <td><%#Eval("RealName")%></td>
                    <td><%#Eval("Phone")%></td>
                    <td><%#EnumHelper.GetDescription<UserType>(Convert.ToInt64(Eval("UserType")))%></td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                    </td>
                    <td><%#Eval("CreateDate")%></td>
                    <td>
                        <a href='<%# "/UserInfo/Edit.aspx?id=" + Eval("UserId") %>'>修改</a>
                        &nbsp;
                        <asp:LinkButton ID="lblDel" runat="server" Text="Label"
                            CommandName="Del" CommandArgument='<%#Eval("UserId") %>'
                            OnClientClick="return confirm('确认删除吗')">删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        
        </asp:Repeater>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="/js/commno.js"></script>
    <script type="text/javascript">
        var userId = document.getElementById("txtUserId");
        //监听按下键是否为纯数字
        userId.onkeydown = function (e) {
            return isNumber(e);
        };
        //监听粘贴是否为纯数字
        userId.onpaste = function (e) {
            return isPasteNumber(e);
        };
    </script>
</asp:Content>
