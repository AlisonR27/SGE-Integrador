<%@ Page Title="Gerenciar Esportes" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport"%>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="head">   
    <style>
        body{
            background-color: #d9d9d9;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-sm-12">
            <h2 style="padding-top: 10px">Gerenciamento de esportes</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h6>Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="w-75 col-auto border-0" runat="server" class="name_box"></asp:TextBox>
                    <asp:Label ID="NameErr" CssClass="text-danger w-100" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <h6>Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="w-100 col-auto border-0" TextMode="MultiLine" runat="server" class="desc_box" Style="resize: none"></asp:TextBox>
                    <asp:Label ID="DescErr" CssClass="text-danger w-100" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter" class="btn-success mt-3 ml-3"/>
        <div class="col-sm-12" >
            <h2 style="padding-top: 10px">Atividades esportivas já cadastradas:</h2>
        </div>
        <hr />
        <div class="container-fluid">
            <div class="row">
                <asp:GridView ID="SportsView" runat="server" ViewStateMode="Disabled" DataSourceID="SportsOBJDS" class="gridview_sport" BackColor="White" OnRowCommand="SportsView_RowCommand" EnableViewState="False" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                        <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                        <asp:BoundField DataField="descricao" HeaderText="Descricao" SortExpression="descricao" />
                        <asp:ButtonField Text="Editar" CommandName="Editar"  />
                    </Columns>
                </asp:GridView>        
                <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>