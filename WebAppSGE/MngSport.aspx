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
    <style>
        body{
            background-color: #d9d9d9;
        }
        .ttl{
            position: relative;
            top: 20px;
            left: 20px;
        }

        .div_info{
            position: relative;
            left: 20px;
        }

        .name_box{
            width: 500px;

        }

        .desc_box{
            width: 500px;
            height: 50px;
        }

        .submit_btn{
            position: relative;
            left: 20px;
            top: 10px;
            background-color: #0CA22E;
            color: white;
            border-radius: 5px;
        }

        .gridview_sport{
            position: relative;
            left: 20px;
            top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="ttl">Gerenciamento de esportes </h2>
            <hr />
            <div class="div_info">
                <h6 class="inputTitle">Nome:</h6>
                <asp:TextBox ID="TextBoxName" runat="server" class="name_box"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                <h6 class="inputTitle">Descrição:</h6>
                <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" runat="server" class="desc_box"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                <br />
            </div>
        </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter" class="submit_btn"/>
        <br />
        <h2 class="ttl">Atividades esportivas já cadastradas:</h2>
        <asp:GridView ID="SportsView" runat="server" DataSourceID="SportsOBJDS" class="gridview_sport" BackColor="White"></asp:GridView>
        
        <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
        
    </form> 
</body>
</html>
