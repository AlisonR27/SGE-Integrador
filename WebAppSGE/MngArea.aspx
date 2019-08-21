<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngArea.aspx.cs" Inherits="WebAppSGE.MngArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gerenciamento de áreas poliesportivas </h2>
            <hr />
            <h6 class="inputTitle">Nome:</h6>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle">Descrição:</h6>
            <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle"> Imagens </h6>
            <div class="imgSub">
                <img src=""/>
            </div>
            <asp:Button runat="server" Text="Fazer Upload"/>
            <br />
            <h6 class="inputTitle"> Lista de esportes: </h6>
            <div class="SportsContent">
                <div class="sportItem"></div>
            </div>
            <h6 class="inputTitle"> Lista de Esportes: </h6>
            <asp:DropDownList ID="SportsList" runat="server"></asp:DropDownList>
            <asp:Button runat="server" ID="AddSport" Text="Adicionar"/>
            <br />
            <h6 class="inputTitle"> Lista de dias: </h6>
            <asp:DropDownList ID="DaysList" runat="server" OnSelectedIndexChanged="DDChange"></asp:DropDownList>
            <h6 class="inputTitle"> De: </h6>
            <asp:TextBox runat="server" ID="InitialTime"></asp:TextBox>
       &nbsp<h6 class="inputTitle"> Até: </h6>
            <asp:TextBox runat="server" ID="FinalTime"></asp:TextBox>
            <br />
            <h6 class="inputTitle"> Dias adicionados: </h6>
            <div class="daysDynBut"> </div>
            <br />
        </div>
        <asp:Button runat="server" OnClick="Submit" id="FormSubmit"/>
    </form>
</body>
</html>
