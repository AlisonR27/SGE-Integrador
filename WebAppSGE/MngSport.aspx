﻿<%@ Page Title="Gerenciar Esportes" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="MngSport.aspx.cs" Inherits="WebAppSGE.MngSport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            background-color: #d9d9d9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div>
            <h2 class="ttl Row">Gerenciamento de esportes </h2>
            <hr />
            <div class="div_info fScreen row">
                <div class="col-12 ml-3">
                    <h6 class="inputTitle row">Nome:</h6>
                    <asp:TextBox ID="TextBoxName" CssClass="row" runat="server" class="name_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxName"  runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-12 ml-3 mt-3">
                    <h6 class="inputTitle row">Descrição:</h6>
                    <asp:TextBox ID="TextBoxDesc" CssClass="row" TextMode="MultiLine" runat="server" class="desc_box"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator> 
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="SubmitButton" OnClick="FormSubmit_Click" Text="Submeter" class="btn-success mt-3"/>
        <div class="row mt-3" >
            <h2 class="ttl col-12">Atividades esportivas já cadastradas:</h2>
            <asp:GridView ID="SportsView" runat="server" DataSourceID="SportsOBJDS" class="gridview_sport" BackColor="White" EnableViewState="False"></asp:GridView>        
            <asp:ObjectDataSource ID="SportsOBJDS" runat="server" DataObjectTypeName="WebAppSGE.Modelo.Sports" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
    </div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonContent" runat="server">
    <asp:Button  runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>      
