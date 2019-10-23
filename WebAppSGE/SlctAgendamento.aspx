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
                <div class="col-sm-6"><h2 style="padding-top: 10px">Solicitar Área esportiva</h2></div>
                <hr />
            </div>            
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-2">
                        <h6 class="h6 d-block">ID da área:</h6>
                        <asp:TextBox CssClass="w-100 d-block border-0 px-1 py-1 bigInput mb-2" runat="server" ID="txtidarea" Enabled="False" Style="resize: none"></asp:TextBox> 
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <h6 class="">Do dia:</h6>
                        <asp:TextBox CssClass="w-100 px-1 py-2 border-0" runat="server" ReadOnly="true" ID="txtdataInit" ToolTip="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <h6 class="">Até o dia:</h6>
                        <asp:TextBox CssClass=" w-100 px-1 py-2 border-0" runat="server" ID="txtdatalmite" TextMode="Date" ToolTip="dd/mm/yyyy"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-1 mb-3">
                    <div class="col-md-4">
                            <h6 class="row pl-3">Repetição</h6>
                            <asp:DropDownList runat="server" CssClass="px-5 py-2" ID="dropdown1">
                                <asp:ListItem Value="0">Nenhuma</asp:ListItem>
                                <asp:ListItem Value="1">Semanal</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                <div class="row mb-3">
                     <div class="col-sm-2">
                        <div><h6>Das:</h6></div>
                        <asp:TextBox runat="server" CssClass="col-auto py-2 border-0" TextMode="Time" ID="TextBoxDe"></asp:TextBox>
                   </div>
                    <div class="col-sm-2">
                        <div><h6>Até as:</h6></div>
                        <asp:TextBox runat="server" CssClass="col-auto py-2  border-0" TextMode="Time"  ID="TextBoxAte"></asp:TextBox>
                    </div>
                </div>
                <h6 class="mb-1">Motivo:</h6>
                <div class="row">
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" CssClass=" w-100 h-100" TextMode="MultiLine" ID="TextBoxMotivo"></asp:TextBox>
                    </div>
                    <div>
                        <asp:CheckBoxList runat="server" ID="CBL1" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id"></asp:CheckBoxList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectSportsOfArea" TypeName="WebAppSGE.DAL.DALAreaSport">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="AreaID" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                   
                </div>
                
                <div class="row mt-5">
                    <div class="col-md-4">
                        <asp:Button CssClass="btn px-5 py-2 btn-success rounded-pill b-none" Text="Solicitar" runat="server" ID="btnsolicitar" OnClick="btnsolicitar_Click" />
                    </div>
                </div>                    
        </div>
        </div>
</asp:Content>