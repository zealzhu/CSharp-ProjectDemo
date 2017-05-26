<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ProjectDemo.OPPortal.News.Edit" ClientIDMode="Static" validateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <table>
        <tr>
            <th>新闻分类：</th>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>标题：</th>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>状态：</th>
            <td>
                <asp:RadioButtonList ID="rdblStatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Text="不显示"></asp:ListItem>
                    <asp:ListItem Value="1" Text="显示" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th>内容：</th>
            <td>
                <script id="container" name="content" type="text/plain">
                </script>
                <asp:HiddenField ID="hfContent" runat="server" />
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClientClick="save()" OnClick="btnSave_Click"/>
                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClientClick="javascrpit:window.history.back();"/>
            </td>
        </tr>
    </table>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container', {
            initialFrameWidth: 700,//初始宽度
            initialFrameHeight: 300,//初始高度
        });
        //在初始化后调用
        ue.ready(function () {
            var content = '<%=base.contentValue%>'
            ue.setContent(content);
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script type="text/javascript">
        
        function save() {
            document.getElementById("hfContent").value = ue.getContent()
        }
    </script>
</asp:Content>
