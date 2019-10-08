<%@ Page Title="" Language="C#" MasterPageFile="~/SGE.master" AutoEventWireup="true" CodeBehind="EditarPerfil.aspx.cs" Inherits="WebAppSGE.EditarPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .left-0{
            left:0 !important;
        }
        body{
            min-width:300px     ;
            overflow:hidden;
        }
        .h3s{
            height:1.5rem;
            margin: -0.75em 0.25em 0 0.5em;
        }
        .thumb img{
                 object-fit: none;
                 object-position: center; 
                 width: 100%;
                 height:100%;
                 border-radius:50%;
                 margin-bottom: 1rem;
        }
        @media (max-width:480px){
            .thumb img{
                width:100px;
                height:100px;
            }
        }
        @media (min-width:480px) {
            .thumb img{
                 width:125px;
                 height:125px;  
            }
        }
        @media (min-width:576px) {
            .thumb img{
                 width:170px;
                 height:170px;  
            }
        }
        @media (min-width:768px) {
            .thumb img{
                 width:200px;
                 height:200px;  
            }
        }
        @media (min-width:992x) {

        }
        @media (min-width:1200px) {

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
        <asp:Button  runat="server" ID="Button1" Text="Sair" CssClass="text-danger border-danger bg-transparent rounded-pill w-50  d-block  mt-2 mx-auto" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col left-0 ">\
       <h2 class="h2">Gerenciar Perfil</h2>
       <div class="row bg-light m-0">
           <div class="col-4 ml-5">
                <div class="thumb">
                    <img class="" src="https://img.quizur.com/f/img5c9067f8413985.05623253.jpeg?lastEdited=1552967790  " />
                </div>
           </div>
           <div class="col align-items-end">
               <div class="row ">
                   <div class="col">
                       <h3 class="h3 d-inline-block m-0">LOREM IPSUM</h3><img class="h3s" src="src/svgs/solid/pencil-alt.svg"/>

                   </div>
               </div>
               <div class="row">
                   <h6 class="h6">ID #kdkskdjk</h6>
               </div>
               <div class="row">
                   <h6 class="h6 small">Desde 02/02/2002</h6>
               </div>
           </div>
       </div>
    </div>
</asp:Content>
