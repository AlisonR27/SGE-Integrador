<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jcrop.aspx.cs" Inherits="WebAppSGE.jcrop" %>

 <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link href="jquery.Jcrop.css" rel="stylesheet" />--%>
    <script src="Scripts/jcrop/js/jquery.min.js"></script>
    <script src="Scripts/jcrop/js/jquery.Jcrop.js"></script>
    <script>
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



    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src="src/macaiba2.PNG" id="cropimage1" runat="server" />
        <input type="hidden" id="coordinate_x" runat="server"/>
          <input type="hidden" id="coordinate_y" runat="server"/>
          <input type="hidden" id="coordinate_w" runat="server"/>
          <input type="hidden" id="coordinate_h" runat="server"/>
        <asp:Button ID="Button1" runat="server" Text="Crop"  OnClientClick="vnx"/>
        <img src="" id="cropimg" runat="server" visible="false" />
    
    </div>
    </form>

</body>
</html>
