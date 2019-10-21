<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="ListSolicitacoesAdmin.aspx.cs" Inherits="WebAppSGE.ListSolicitacoesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
    function sli(aa) {
        var xx = $(aa).attr("id");
        console.log('a');
        $('.tablecolapse').not('#' + xx + 'col').slideUp(50);
        $('#'+xx+'col').slideToggle(100);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <HeaderTemplate>
            <div class="bg-dark border text-light text-center w-100" id="tb1">
                <div class="row w-100 m-0">
                    <div class="col-2 border"><span>Id</span></div>
                    <div class="col-2 border"><span>Motivação</span></div>
                    <div class="col-2 border"><span>Atividades</span></div>
                    <div class="col-1 border"><span>Inicio</span></div>
                    <div class="col-1 border"><span>Fim</span></div>
                    <div class="col-1 border"><span>Solicitante</span></div>
                    <div class="col-1 border"><span>Status</span></div>
                    <div class="col-1 border"><span>ID Analista</span></div>
                </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row w-100 m-0" id="<%# DataBinder.Eval(Container.DataItem,"id") %>">
                <div class="col-2 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"id") %></span></div>
                <div class="col-2 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"motivo_solicitacao") %></span></div>
                <div class="col-2 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"atividades_realizadas") %></span></div>
                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"data_ini").ToString().Substring(0,10) %></span></div>
                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"data_fim").ToString().Substring(0,10)%></span></div>
                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"id_Usuario_Solicitante") %></span></div>
                <div class="col-1 bg-secondary border"><span><%# getStatus(DataBinder.Eval(Container.DataItem, "status").ToString()) %></span></div>
                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"id_usuario_analise") %></span></div>
                <div class="col bg-secondary border p-0"><button class="w-100 btn btn-outline-primary" type="button" onclick="sli(this)" Id="<%#  DataBinder.Eval(Container.DataItem,"id") %>" data-toggle="collapse" data-target="#<%# DataBinder.Eval(Container.DataItem,"id")%>col" aria-expanded="false" aria-controls="<%# DataBinder.Eval(Container.DataItem,"id")%>col">▼</button></div>
            </div>
            <div id="<%# DataBinder.Eval(Container.DataItem,"id")%>col" class="collapse tablecolapse bg-info" aria-labelledby="<%# DataBinder.Eval(Container.DataItem,"id") %>" data-parent="#<%# DataBinder.Eval(Container.DataItem,"id") %>">
                <div class="row">
                    <div class="col-4 px-4 py-1 text-left">
                        <h5 class="h5">Motivo:</h5>
                        <span><%#DataBinder.Eval(Container.DataItem,"motivo_solicitacao")%></span>
                    </div>
                </div>
                <div class="row">
                    <asp:Button runat="server" CssClass="btn btn-success"/>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.SolicitacaoReserva" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSolicitacaoReserva" UpdateMethod="UpdateAdmin"></asp:ObjectDataSource>
</asp:Content>
