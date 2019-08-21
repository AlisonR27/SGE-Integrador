<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StyleTesting.aspx.cs" Inherits="WebAppSGE.StyleTesting"  StylesheetTheme="Base"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="App_Themes/Light/LightBase.css" rel="stylesheet" />
    <link href="App_Themes/Base/Basement.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="fScreenContainer">
            <h2> Submission Forms </h2>
            <div class="Row">
                <div class="InputBox diblock Pad1Both VAlign">
                    <h4 class="InputTitle Margin0"> TextBox Title:</h4>
                    <asp:TextBox runat="server"></asp:TextBox>
                </div>
                <div class="imgForm MGrayGradientBG Pad1Ver diblock VAlign">
                    <h5 class="Margin0 TAlignCenter" > Submit Image </h5>
                    <img  src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-128.png" class="imgFormIcon" />
                    <asp:Button runat="server" ID="ID2" class="center60 dblock buttont1" Text="SDASD" />
                </div>
            </div>
        </div>
        <div>
            <h2> Search Forms </h2>
        </div>
        <div>
            <h2> Common Style </h2>
        </div>
    </form>
</body>
</html>
