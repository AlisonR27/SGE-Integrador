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

            <h6 class="inputTitle mt-1">Lista de Esportes: </h6>
                <div class="row ml-1">
                    <div class="col-sm-6">
                        <div class="selectedSports">
                            <h5 class="TAlignCenter">Esportes selecionados</h5>
                            <asp:CheckBoxList runat="server" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id" CssClass="d-inline-block" ID="CBL" RepeatLayout="UnorderedList"></asp:CheckBoxList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="WebAppSGE.DAL.DALSport"></asp:ObjectDataSource>
                        </div>
                    </div>
                    <div class="col-6"></div>
                <div class="col-12">
                <h6 class="row h6">Horários </h6>
                <div class="w-100">
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Domingo</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTDomInit"></asp:TextBox>
                            <asp:Label runat="server" ID="DomInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTDomEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="DomEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Segunda</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSegInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SegInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSegEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SegEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Terça</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server"  TextMode="Time" ID="TXTTerInit"></asp:TextBox>
                            <asp:Label runat="server" ID="TerInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTTerEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="TerEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Quarta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuaInit"></asp:TextBox>
                            <asp:Label runat="server" ID="QuaInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuaEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="QuaEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Quinta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuiInit"></asp:TextBox>
                            <asp:Label runat="server" ID="QuiInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTQuiEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="QuiEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Sexta</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>
                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSexInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SexInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSexEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SexEndErr" CssClass="text-danger w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="slideDContainer">
                        <div class="slideDTitle">   
                            <h5>Sábado</h5>
                        </div>
                        <div class="slideDOcult">
                            <input type="checkbox" class="checkDay"  id="checkDay" name="checkDay" checked/>
                            <label for="checkDay">Disponível</label>                            <h6> Inicio: </h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSabInit"></asp:TextBox>
                            <asp:Label runat="server" ID="SabInitErr" CssClass="text-danger w-100"></asp:Label>
                            <br />
                            <h6>Fim:</h6>
                            <asp:TextBox runat="server" TextMode="Time" ID="TXTSabEnd"></asp:TextBox>
                            <asp:Label runat="server" ID="SabEndErr" CssClass="text-danger w-100"></asp:Label>
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
