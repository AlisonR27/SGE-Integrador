<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EditSport.aspx.cs" Inherits="WebAppSGE.EditSport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <asp:Panel runat="server" ID="ErrorPanel"  CssClass="position-absolute transparent-gray w-100 h-100" Visible="false" ViewStateMode="Disabled"> 
        <asp:Panel CssClass="d-block minw px-4 py-2 col-7 mb-5 bg-light m-auto align-middle" runat="server">
            <img class="w-25 d-block mx-auto my-5" src="src/imgs/sad.png"/>
            <h2 class="h2 text-center text-danger">Erro</h2>
            <h3 class="h3 text-center">Essa página não pode ser acessada sem redirecionamento!</h3>
            <a class="d-block mx-auto text-center py-2" href="InitialPage.aspx">Clique aqui para voltar para a página inicial.</a>
        </asp:Panel>
    </asp:Panel>
        <div class="container-fluid">
        <div>
            <h3 class="h3">Esporte Selecionado</h3>
            <hr />
            <div class="div_info fScreen row">
                <div class="col-12 ml-3">
                    <h6 class="inputTitle row">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="row col-12" runat="server" class="name_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-12 ml-3 mt-3">
                    <h6 class="inputTitle row">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="row col-12" TextMode="MultiLine" runat="server" class="desc_box" Style="resize: none"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
            </div>
        </div>
            
            <div  class="mt-2">
                <asp:Button runat="server" CssClass="btn-primary rounded-pill col-auto b-none" Text="Atualizar" OnClick="Unnamed3_Click"/>                
                <asp:Button runat="server" CssClass="btn-danger rounded-pill offset-md-9 offset-sm-8 col-auto b-none" Text="Excluir" OnClick="Unnamed4_Click"/>
            </div>
        </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="WebAppSGE.DAL.DALSport">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idsport" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
