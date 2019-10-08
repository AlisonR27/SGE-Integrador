<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="SolicitacoesAgendamento.aspx.cs" Inherits="WebAppSGE.SolicitacoesAgendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                    <h2>Solicitações de uso das Áreas esportivas</h2>    
                    <div class="row text-light col-12"><p>Pesquisa área por nome:</p></div>
                    <div class="row">
                        <div class="container-fluid ml-3">
                            <asp:TextBox runat="server" CssClass="col-md-5 mb-2 mt-sm-2" ID="TextBoxSearch"></asp:TextBox>                            
                            <asp:LinkButton runat="server" CssClass="btn-primary col-md-2 col-2 mb-2 mt-sm-2 px-2 py-1 pillborder" ID="Searchbtn"><img class="h-1 pb-1" src="src/svgs/solid/search.svg" /> Buscar</asp:LinkButton>
                            <asp:DropDownList runat="server" ID="dropFiltro" CssClass="offset-md-1 col-md-3 col-8  mt-2 mb-sm-2 w-100"></asp:DropDownList>
                             <table class="table table-bordered" id="TbSolicitacoes">
                                <tr class="bg-light">
                                    <td class="col-auto">Código</td>
                                    <td class="col-auto">Área Solicitada</td>
                                    <td class="col-auto">ID Solicitante</td>
                                    <td class="col-auto">Data da Solicitação</td>
                                </tr>
                            <asp:Repeater runat="server" ID="RepeaterTable"> 
                                <tr>      
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>      
                                    <td colspan="4"></td>                                    
                                </tr>
                            </asp:Repeater>
                            </table>      
                            
                        </div>                
                    </div>
                </div>
</asp:Content>
