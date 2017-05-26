<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ProjectDemo.OPPortal.Product.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <table>
        <tr>
            <th>产品分类：</th>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>产品名称：</th>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>产品品牌：</th>
            <td>
                <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>产品型号：</th>
            <td>
                <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>产品描述：</th>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>产品图片：</th>
            <td>
                <asp:FileUpload ID="fuProductUrl" runat="server" />
                <asp:Image ID="imgProduct" Width="270px" Height="270px" runat="server" />
                <br />
                <span>尺寸：270*270 大小：小于1MB 格式：jpg、jpeg、gif、png、bmp</span>
                <asp:Button ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click"
                    OnClientClick="checkImage(document.getElementById('fuProductUrl'),1);"/>
                <asp:HiddenField ID="hfImageUrl" runat="server" />
                <asp:HiddenField ID="hfThumbUrl" runat="server" />
            </td>
        </tr>
        <tr>
            <th>排序</th>
            <td>
                <asp:TextBox ID="txtSortIndex" runat="server"></asp:TextBox>
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
            <th></th>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClientClick="javascrpit:window.history.back();"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script type="text/javascript">
        //验证图片格式
        function checkImage(ele, size) {
            //验证大小          
            var img = ele.files[0];  //获取图片文件
            if (typeof (img) == "undefined") {
                alert("还没有选择文件");
                return false;
            }
            var imgSize = img.size;
            if (imgSize > 1024 * 1024 * size) {
                alert("文件超过限制大小");
                return false;
            }

            //验证格式
            var name = img.name;
            var arrExtension = ['jpg', 'jpeg', 'gif', 'png', 'bmp',];  //允许的图片格式
            var extensionIndex = name.lastIndexOf(".") + 1;     //后缀起始位置
            var extension = name.substring(extensionIndex, name.length).toLowerCase();
            var flag = false;
            for (var i = 0; i < arrExtension.length; i++) {
                if (arrExtension[i] == extension) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                alert("图片格式不正确");
            }
            return flag;
        }
    </script>
</asp:Content>
