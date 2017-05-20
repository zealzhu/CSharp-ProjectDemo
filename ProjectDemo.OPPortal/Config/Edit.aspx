<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ProjectDemo.OPPortal.Config.Edit"  ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <table>
        <tr>
            <th>
                关于首页图片：
            </th>
            <td>
                <asp:FileUpload ID="fuAboutImgUrl" runat="server" />
                <asp:Image ID="imgAbout" runat="server" Width="220" Height="100"/>
                <br />
                <span>图片尺寸：220*100，大小不超过0.5MB，格式：jpg、gif、png、bmp</span>
                <asp:Button ID="btnUpload" OnClick="btnUpload_Click" runat="server" Text="上传" OnClientClick="return checkImage(document.getElemnetById('fuAboutImgUrl', 0.5);"/>
                <asp:TextBox ID="txtAboutImgUrl" runat="server" ValidationGroup="vgUpload" CssClass="hidden"></asp:TextBox>           
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" ValidationGroup="vgUpload"/>
                <asp:Button ID="btnCancel" runat="server" Text="取消" />
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" ErrorMessage="请上传图片" 
                    ValidationGroup="vgUpload" ControlToValidate="txtAboutImgUrl" ForeColor="Red"/>
                
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
            var arrExtension = ['jpg', 'gif', 'png', 'bmp', ];  //允许的图片格式
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
