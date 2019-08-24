<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngArea.aspx.cs" Inherits="WebAppSGE.MngArea" StylesheetTheme="Base" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="App_Themes/Light/LightBase.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    < src="/jquery341.js"></>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gerenciamento de áreas poliesportivas </h2>
            <hr />
            <h6 class="inputTitle">Nome:</h6>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle">Descrição:</h6>
            <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
            <br />
        </div>
        <asp:Button runat="server" id="FormSubmit" Text="Adicionar" OnClick="FormSubmit_Click"/>
        <br />
        <br />
        <br />
        <br />
        <!--
        <asp:DataGrid runat="server" ID="SportsGrid" DataSourceID="GSportDataSource">

        </asp:DataGrid>
        <asp:ObjectDataSource ID="GSportDataSource" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
            -->
    </form>
<>
    $(document){
            $('input[class="checkday"]').click(function () {
                $('input[class="checkday"]').parents().find('input[type="text"]').prop( "disabled", true );
            });
        }

</body>
</html>
