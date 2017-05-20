<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ProjectDemo.OPPortal.Category.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <table>
        <tr>
            <th>分类名称：</th>
            <td>
                <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>分类类型：</th>
            <td>
                <asp:RadioButtonList ID="rdblType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">链接</asp:ListItem>
                    <asp:ListItem Value="2">内容页</asp:ListItem>
                    <asp:ListItem Value="3">新闻列表</asp:ListItem>
                    <asp:ListItem Value="4">产品列表</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th>父级分类：</th>
            <td>
                <asp:DropDownList ID="ddlParentId" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>状态：</th>
            <td>
                <asp:RadioButtonList ID="rdblStatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">不显示</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">显示</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th>排序：</th>
            <td>
                <asp:TextBox ID="txtSortIndex" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>跳转链接：</th>
            <td>
                <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"/>
                <asp:Button ID="btnCancel" runat="server" Text="取消" 
                    OnClientClick="javascript:window.history.back();"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
