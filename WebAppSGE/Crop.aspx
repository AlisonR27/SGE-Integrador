<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crop.aspx.cs" Inherits="WebAppSGE.Crop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Scripts/jcrop/js/jquery.min.js"></script>
    <link href="Scripts/jcrop/css/jquery.Jcrop.css" rel="stylesheet" />
    <script src="Scripts/jcrop/js/jquery.Jcrop.js"></script>
    <script >
        $(function () {
            $("#cropimage1").Jcrop({
                aspectRatio: 100/100,
                onSelect: croparea

            });
        });
        function croparea(c) {
            $("#coordinate_x").val(c.x);
            $("#coordinate_y").val(c.y);
            $("#coordinate_w").val(c.w);
            $("#coordinate_h").val(c.h);
        }

         function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=cropimage1.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel  runat="server"  ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:FileUpload  ViewStateMode="Disabled" EnableViewState="false"  onchange="ImagePreview(this);" runat="server" ID="FU1"/>
                    <img runat="server" src="" ID="cropimage1"/>
                </ContentTemplate>
                <Triggers></Triggers>
            </asp:UpdatePanel>
                 <%--  <img src="src/macaiba2.PNG" id="cropimage1" runat="server" />--%>
        <input type="hidden" id="coordinate_x" runat="server"/>
          <input type="hidden" id="coordinate_y" runat="server"/>
          <input type="hidden" id="coordinate_w" runat="server"/>
          <input type="hidden" id="coordinate_h" runat="server"/>
            <asp:Button runat="server"  OnClick="Unnamed_Click"/>
        <img src="" id="cropimg" runat="server" visible="false" />

        </div>
    </form>
</body>
</html>
