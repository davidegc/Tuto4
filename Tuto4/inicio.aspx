<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Tuto4.inicio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="resources/css/sesion.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/b7c6d527ac.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">

                <div class="col-12 user-img">
                    <img src="resources/img/face.png" alt="Alternate Text" />
                </div>

                <%--<h2>Iniciar Sesión</h2>--%>

                <form id="form1" runat="server" class="col-12">
                <asp:ScriptManager ID="smLogin" runat="server"></asp:ScriptManager>

                    <div class="form-group">
                        <i class="fas fa-user form-icons"></i>
                        <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control form-text" placeholder="Usuario"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCurp" runat="server" ErrorMessage="Campo requerido" Display="none" ControlToValidate="txtCURP"></asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group">
                        <i class="fas fa-lock form-icons"></i>
                        <asp:TextBox ID="txtClave" runat="server" CssClass="form-control form-text" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvClave" runat="server" ErrorMessage="Campo requerido" Display="none" ControlToValidate="txtClave"></asp:RequiredFieldValidator>
                    </div>

                    <asp:LinkButton ID="lnkIniciar" runat="server" OnClick="Iniciar_Click" CssClass="form-control btn btn-primary btn-log">
                            <i class='fas fa-sign-in-alt'></i>Iniciar Sesión
                    </asp:LinkButton>

                    <div class="col-12 forgot">
                        <asp:LinkButton ID="lnkRegistro" runat="server" OnClick="lnkRegistro_Click" CausesValidation="false">Registrate aquí</asp:LinkButton>
                    </div>

                </form>

            </div>
            <!--- End of Modal Content --->
        </div>
    </div>

</body>
</html>
