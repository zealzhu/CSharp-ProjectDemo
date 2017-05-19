<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ProjectDemo.OPPortal.Category.List" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Import Namespace="ProjectDemo.Common" %>
<%@ Import Namespace="ProjectDemo.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gvCategory_RowDataBound">
        <%-- 间隔行颜色 --%>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CategoryId" HeaderText="分类编号" HeaderStyle-Width="80"/>
            <asp:BoundField DataField="Name" HeaderText="分类名称" HeaderStyle-Width="80"/>
            <asp:TemplateField HeaderText="栏目类型" HeaderStyle-Width="80">
                <ItemTemplate>
                    <asp:Label ID="lblTypeId" runat="server" Text='<%# Eval("Type") %>' Visible="false" />
                    <asp:Label ID="lblTypeName" runat="server" Text='<%# Convert.ToInt64(Eval("Type")).GetDescription<CategoryType>() %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ParentName" HeaderText="父分类名称" HeaderStyle-Width="80"/>
            <asp:TemplateField HeaderText="状态" HeaderStyle-Width="80">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Convert.ToInt64(Eval("Status")).GetDescription<ShowOrHide>() %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SortIndex" HeaderText="排序" />
            <asp:TemplateField HeaderText="内容操作" HeaderStyle-Width="80">
                <ItemTemplate>
                    <asp:HyperLink ID="hlContentOperate" runat="server" Visible="false">编辑内容</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="操作" HeaderStyle-Width="80"/>
        </Columns>
        <%-- 样式 --%>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <%-- 分页 --%>
    <webdiyer:AspNetPager runat="server" ID="anpCategory" AlwaysShow="true" 
        PageSize="10" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
        OnPageChanging="anpCategory_PageChanging"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
