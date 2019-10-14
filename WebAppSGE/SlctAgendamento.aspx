<%@ Page Title="Tal" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="~/SlctAgendamento.aspx.cs" Inherits="WebAppSGE.SlctAgendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel runat="server" ID="ErrorPanel"  CssClass="position-absolute transparent-gray w-100 h-100" Visible="false" ViewStateMode="Disabled"> 
        <asp:Panel CssClass="d-block minw px-4 py-2 col-7 mb-5 bg-light m-auto align-middle" runat="server">
            <img class="w-25 d-block mx-auto my-5" src="src/imgs/sad.png"/>
            <h2 class="h2 text-center text-danger">Erro</h2>
            <h3 class="h3 text-center">Essa página não pode ser acessada sem redirecionamento!</h3>
            <a class="d-block mx-auto text-center py-2" href="InitialPage.aspx">Clique aqui para voltar para a página inicial.</a>
        </asp:Panel>
    </asp:Panel>
            <div class="container-fluid">
            <div class="row pl-3">
                <div class="col-sm-6"><h2 style="padding-top: 1%">Solicitar áreas esportivas</h2></div>
                <hr />
            </div>            
            <div class="container-fluid">
                <div class="row pl-3"><h6>Motivo:</h6></div>
                <div class="row">
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" CssClass=" w-100 h-100 pb-sm-0 pb-4" ID="TextBoxMotivo"></asp:TextBox>
                    </div>
                    <div>
                        <asp:CheckBoxList runat="server" ID="CBL1" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id"></asp:CheckBoxList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectSportsOfArea" TypeName="WebAppSGE.DAL.DALAreaSport">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="AreaID" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                    <div class="col-sm-2">
                        <div><h6>Das:</h6></div>
                        <asp:TextBox runat="server" CssClass="col-auto" TextMode="Time" ID="TextBoxDe"></asp:TextBox>
                   </div>
                    <div class="col-sm-2">
                        <div><h6>Até as:</h6></div>
                        <asp:TextBox runat="server" CssClass="col-auto" TextMode="Time"  ID="TextBoxAte"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-md-4">
                            <h6 class="row pl-3">Repetição</h6>
                            <asp:DropDownList runat="server" CssClass="col-auto" ID="dropdown1">
                                <asp:ListItem Value="0">Nenhuma</asp:ListItem>
                                <asp:ListItem Value="1">Diaria</asp:ListItem>
                                <asp:ListItem Value="2">Semanal</asp:ListItem>
                            </asp:DropDownList>
                        <div class="row mt-1">
                        <div class="col-md-5">
                        </div>
                    </div>
                    </div>
                    <div class="col-md-2">
                        <h6 class="row pl-3">Até o dia:</h6>
                        <asp:TextBox CssClass=" col-auto" runat="server" ID="txtdatalmite" TextMode="Date" ToolTip="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <h6 class="row Wpl-3">ID da área:</h6>
                        <asp:TextBox CssClass=" col-auto" runat="server" ID="txtidarea" Enabled="False" Style="resize: none"></asp:TextBox>
                    </div>      
                </div>
                <div class="row mt-2 pl-3">
                    <asp:Button CssClass="col-auto btn-success rounded-pill b-none" Text="Solicitar" runat="server" ID="btnsolicitar" OnClick="btnsolicitar_Click" />
                </div>                    
        </div>
        </div>
</asp:Content>



