<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterLinks.aspx.cs" Inherits="WebAppSGE.MasterLinks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body{
            background:#404040;
            margin:0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Detalhamento de Área</td>
                    <td><a href="DetalharArea.aspx">DetalharArea.aspx</a></td>
                </tr>
                <tr>
                    <td>Editar Áreas Esportivas</td>
                    <td><a href="EditArea.aspx">EditArea.aspx</a></td>
                </tr>
                <tr>
                    <td>Edição do próprio perfil</td>
                    <td><a href="EditarPerfil.aspx">EditarPerfil.aspx</a></td>
                </tr>
                <tr>
                    <td>Edição das atividdades Esportivas</td>
                    <td><a href="EditSport.aspx">EditSport.aspx</a></td>
                </tr>
                <tr>
                    <td>Entrar no sistema</td>
                    <td><a href="DetalharArea.aspx">Entrar.aspx</a></td>
                </tr>
                <tr>
                    <td>Especificar deferimento</td>
                    <td><a href="DetalharArea.aspx">EspDeferimento.aspx</a></td>
                </tr>
                <tr>
                    <td>Página Inicial</td>
                    <td><a href="DetalharArea.aspx">DetalharArea.aspx</a></td>
                </tr>
                <tr>
                    <td>Página da lista de Solicitações </td>
                    <td><a href="DetalharArea.aspx">DetalharArea.aspx</a></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
