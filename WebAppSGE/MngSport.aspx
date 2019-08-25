<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport" StylesheetTheme="Base" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="App_Themes/Light/LightBase.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <script src="Script/jquery341.js"></script>
    <script src="Script/default.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gerenciamento de esportes </h2>
            <hr />
            <h6 class="inputTitle">Nome:</h6>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle">Descrição:</h6>
            <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
            <br />
        </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter"/>
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="SportsView" runat="server" DataSourceID="SportsOBJDS"></asp:GridView>
        
        <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
        
    </form> 
</body>
</html>
