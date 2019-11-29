<%@ Page Title="" Language="C#" MasterPageFile="~/resources/master/plantilla.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="Tuto4.pages.usuarios.usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Formulario de modificación--%>
    <div runat="server" id="modificar">
        <asp:ScriptManager ID="smRegistro" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hfPersonaId" runat="server" />

        <div class="modal-dialog text-center">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <img src="resources/img/face.png" alt="Alternate Text" />
                    </div>

                    <div class="form-group">
                        <i class="fas fa-user-tag form-icons"></i>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-text" placeholder="Ingresa tu nombre"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvcNombre" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <i class="fas fa-user-tag  form-icons"></i>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control form-text" placeholder="Ingresa tu apellido"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvcApellido" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtApellido" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <i class="fas fa-envelope form-icons"></i>

                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control form-text" placeholder="Ingresa tu curreo" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCorreo" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <i class="fas fa-city form-icons"></i>

                        <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control form-text"></asp:DropDownList>

                        <asp:RequiredFieldValidator ID="efvCiudad" runat="server" ErrorMessage="Campo requerido" ControlToValidate="ddlCiudad" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group">
                        <i class="fas fa-tint form-icons"></i>

                        <asp:ListBox ID="lbxColor" runat="server" SelectionMode="Multiple" CssClass="selectpicker form-control form-text" CausesValidation="false" title="Seleccionar color"></asp:ListBox>

                        <asp:RequiredFieldValidator ID="rfvColor" runat="server" ErrorMessage="Campo requerido" ControlToValidate="lbxColor" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>


                    <div class="dropdown-divider form-divider"></div>


                    <%--Usuario y Contraseña--%>

                    <div class="form-group">
                        <i class="fas fa-user form-icons"></i>
                        <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control form-text" placeholder="Ingresa un usuario" Entable="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCURP" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCURP" Display="Dynamic" CssClass="validation" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <i class="fas fa-lock form-icons"></i>
                        <asp:TextBox ID="txtClave" runat="server" CssClass="form-control form-text" placeholder="Ingresa una contraseña"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvClave" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtClave" Display="Dynamic" CssClass="validation" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <%-- Cancelar y Guardar--%>

                    <asp:LinkButton ID="lnkCancelar" runat="server" OnClick="lnkCancelar_Click" CssClass="form-control btn btn-primary btn-log">
                            <i class='fas fa-save'></i>Registrar
                    </asp:LinkButton>

                    <div class="col-12 forgot">
                        <asp:LinkButton ID="lnkModificar" runat="server" OnClick="lnkModificar_Click" CausesValidation="false"></asp:LinkButton>

                    </div>
                    <!--- End of Modal Content --->
                </div>
            </div>
        </div>
    </div>
    <%-- / Formulario de modificación

    <%--Tabla de usuarios--%>
    <div class="container">
        <div class="table-responsive-md">
            <table class="table">
                <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-bordered table-striped" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Acciones" ShowHeader="True" Text="Ver" ControlStyle-ForeColor="Black" />
                    </Columns>
                </asp:GridView>
            </table>
        </div>
    </div>
    <%--Tabla de usuarios--%>
</asp:Content>
