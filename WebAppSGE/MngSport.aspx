<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport" StylesheetTheme="Base" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="App_Themes/Light/LightBase.css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-4.3.1-dist/css/bootstrap.css" />

    <script src="Script/jquery341.js"></script>
    <script src="Script/default.js"></script>
    <style>
        body{
            background-color: #d9d9d9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container-fluid">
        <div>
            <h2 class="ttl Row">Gerenciamento de esportes </h2>
            <hr />
            <div class="div_info fScreen row">
                <div class="col-12 ml-3">
                    <h6 class="inputTitle row">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="row" runat="server" class="name_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-12 ml-3 mt-3">
                    <h6 class="inputTitle row">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="row" TextMode="MultiLine" runat="server" class="desc_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter" class="btn-success mt-3"/>
        <div class="row mt-3" >
            <h2 class="ttl col-12">Atividades esportivas já cadastradas:</h2>
            <asp:GridView ID="SportsView" runat="server" DataSourceID="SportsOBJDS" class="gridview_sport" BackColor="White" EnableViewState="False"></asp:GridView>        
            <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
    </form> 
</body>
</html>
