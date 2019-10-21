<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EditArea.aspx.cs" Inherits="WebAppSGE.EditArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-8 mx-auto mt-5">
    <h5 class="row bg-dark m-0 h5 px-2 py-2 text-center d-block text-light">
        Área Esportiva
    </h5>
    <div class="container-fluid">
        <div>          
            <div class="div_info fScreen row">
                <div class="col-12 ml-3">
                    <h6 class="inputTitle row">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="row col-12" runat="server" class="name_box"></asp:TextBox>
                    <asp:Label ID="NameErr" CssClass="text-danger w-100" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-12 ml-3 mt-3">
                    <h6 class="inputTitle row">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="row col-12" TextMode="MultiLine" runat="server" class="desc_box" Style="resize: none"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
                 <div class="col-sm-6 mt-3">
                    <div>
                        <h6 class="inputTitle">Imagens </h6>            
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
            </div>
        </div>
            
            <div  class="mt-2">
                <asp:Button runat="server" CssClass="btn-primary rounded-pill col-auto b-none" Text="Atualizar" OnClick="Unnamed3_Click"/>                
                <asp:Button runat="server" CssClass="btn-danger rounded-pill offset-md-9 offset-sm-8 col-auto b-none" Text="Excluir" OnClick="Unnamed4_Click"/>
            </div>
        </div>
        </div>
       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectUnic" TypeName="WebAppSGE.DAL.DALArea">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="id" SessionField="AreaId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
