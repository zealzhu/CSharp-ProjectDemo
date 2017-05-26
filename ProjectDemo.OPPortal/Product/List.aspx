<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ProjectDemo.OPPortal.Product.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <asp:Button ID="btnAdd" runat="server" Text="添加产品" OnClick="btnAdd_Click" />
    <asp:GridView ID="gvProduct" runat="server"
        GridLines="None" AutoGenerateColumns="False" OnRowCommand="gvProduct_RowCommand">
        <%-- 间隔行颜色 --%>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="产品编号"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CategoryId" HeaderText="产品分类"  HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="产品名称"  HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ThumbUrl" HeaderText="ThumbUrl"  HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Status" HeaderText="状态"
                HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="50px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Click" HeaderText="点击数"
                HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="50px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Sort" HeaderText="排序"
                HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="50px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CreateUserId" HeaderText="创建作者"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间"
                HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle Width="80px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UpdateUserId" HeaderText="更新作者"
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
                    <asp:HyperLink ID="hlUpdate" NavigateUrl='<%#"/Product/Edit.aspx?id=" + Eval("ProductId") %>' runat="server">修改</asp:HyperLink>
                    <asp:LinkButton ID="lbDelete" CommandName="del" CommandArgument='<%#Eval("ProductId") %>'
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
