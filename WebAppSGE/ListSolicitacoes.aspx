<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="ListSolicitacoes.aspx.cs" Inherits="WebAppSGE.ListSolicitacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .invert{
            filter:invert();
        }
        .h-1em{
            height: 1.25em;
            vertical-align:text-bottom;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <script>
    function sli(aa) {
        var xx = $(aa).attr("id");
        console.log('a');
        $('.tablecolapse').not('#' + xx + 'col').slideUp(50);
        $('#'+xx+'col').slideToggle(100);
    }
</script>
    <div class="col-10 px-2 offset-1 text-light">
        <asp:Repeater runat="server" DataSourceID="ObjectDataSource1">
            <HeaderTemplate>
                <div class="row w-100 m-0 bg-dark font-weight-bolder">
                    <div class="col-1 py-1 text-center border"><span>Id</span></div>
                    <div class="col-3 py-1 text-center border"><span>Inicio</span></div>
                    <div class="col-3 py-1 text-center border"><span>Fim</span></div>
                    <div class="col-1 py-1 text-center border"><span>Status</span></div>
                    <div class="col-2 py-1 text-center border"><span>ID Analista</span></div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
            <div class="row w-100 m-0" id="<%# DataBinder.Eval(Container.DataItem,"id") %>">
                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"id") %></span></div>
<%--                <div class="col-2 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"motivo_solicitacao") %></span></div>--%>
<%--                <div class="col-2 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"atividades_realizadas") %></span></div>--%>
                <div class="col-3 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"data_ini").ToString().Substring(0,10) %></span></div>
                <div class="col-3 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"data_fim").ToString().Substring(0,10)%></span></div>
<%--                <div class="col-1 bg-secondary border"><span><%# DataBinder.Eval(Container.DataItem,"id_Usuario_Solicitante") %></span></div>--%>
                <div class="col-1 bg-secondary border"><span><%# getStatus(DataBinder.Eval(Container.DataItem, "status").ToString()) %></span></div>
                <div class="col-2 bg-secondary border"><span><%# setUsuarioAnalise(DataBinder.Eval(Container.DataItem,"id_usuario_analise").ToString()) %></span></div>
                <div class="col bg-secondary border p-0"><button class="w-100 btn btn-outline-primary" type="button" onclick="sli(this)" Id="<%#  DataBinder.Eval(Container.DataItem,"id") %>" data-toggle="collapse" data-target="#<%# DataBinder.Eval(Container.DataItem,"id")%>col" aria-expanded="false" aria-controls="<%# DataBinder.Eval(Container.DataItem,"id")%>col">▼</button></div>
            </div>
            <div id="<%# DataBinder.Eval(Container.DataItem,"id")%>col" class="collapse tablecolapse bg-info" aria-labelledby="<%# DataBinder.Eval(Container.DataItem,"id") %>" data-parent="#<%# DataBinder.Eval(Container.DataItem,"id") %>">
                    <div class="col-12 py-1 px-2 w-100">
                        <div class="col-md-4">
                            <h5 class="h4 d-block">Motivação:</h5>
                            <span class="text-light"><%# DataBinder.Eval(Container.DataItem,"motivo_solicitacao").ToString() %></span>
                        </div>
                        <div class="col-md-4">
                            <h5 class="h4 d-block">Atividades:</h5>
                             <span><%# DataBinder.Eval(Container.DataItem,"atividades_realizadas").ToString()%></span>
                        </div>
                    </div>
                    <div class="row py-1 px-2 h-auto w-100">
                        <div ></div>
                        <asp:LinkButton CssClass="col-2 h-10 offset-10 btn btn-danger" runat="server"> <img class="d-inline h-1em invert" src="src/imgs/danger.png" /> Cancelar </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="WebAppSGE.Modelo.SolicitacaoReserva" SelectMethod="SelectYours" TypeName="WebAppSGE.DAL.DALSolicitacaoReserva" UpdateMethod="UpdateAdmin">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id" Type="Int32" />
        </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>
