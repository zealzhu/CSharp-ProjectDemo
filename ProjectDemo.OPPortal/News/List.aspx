<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ProjectDemo.OPPortal.News.List" %>

<%@ Import Namespace="ProjectDemo.Common" %>
<%@ Import Namespace="ProjectDemo.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <asp:Button ID="btnAdd" runat="server" Text="添加新闻" OnClick="btnAdd_Click" />
    <asp:GridView ID="gvNews" runat="server"
        GridLines="None" AutoGenerateColumns="False" OnRowCommand="gvNews_RowCommand">
        <%-- 间隔行颜色 --%>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="NewsId" HeaderText="新闻编号"
                HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="60px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CategoryName" HeaderText="新闻分类"  HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="标题"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="状态"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Convert.ToInt64(Eval("Status")).GetDescription<ShowOrHide>() %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="Click" HeaderText="点击数"
                HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="50px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CreateUserName" HeaderText="创建作者"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UpdateUserName" HeaderText="更新作者"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UpdateDate" HeaderText="更新时间"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="80" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdate" NavigateUrl='<%#"/News/Edit.aspx?id=" + Eval("NewsId") %>' runat="server">修改</asp:HyperLink>
                    <asp:LinkButton ID="lbDelete" CommandName="del" CommandArgument='<%#Eval("NewsId") %>'
                        OnClientClick="return confirm('确认删除吗');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle Width="80px"></HeaderStyle>
            </asp:TemplateField>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
