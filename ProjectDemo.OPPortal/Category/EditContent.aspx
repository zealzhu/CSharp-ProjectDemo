<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="EditContent.aspx.cs" Inherits="ProjectDemo.OPPortal.Category.EditContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <div class="editor_content">
        <div>
            <asp:Label ID="lblName" runat="server" Text="Category Name"></asp:Label>
        </div>
        <script id="container" name="content" type="text/plain">
        </script>
        <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClientClick="javascript:window.history.back();"/>
    </div>
    
   
    <!-- 配置文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container', {
            initialFrameWidth: 700,//初始宽度
            initialFrameHeight: 350,//初始高度
        });
        //在初始化后调用
        ue.ready(function () {
            var content = '<%=base.content%>'
            ue.setContent(content);
            fit();
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
