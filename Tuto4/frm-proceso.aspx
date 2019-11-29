<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm-proceso.aspx.cs" Inherits="Tuto4.frm_proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="resources/css/estilos.css" rel="stylesheet" />
</head>
<body>

    <div class="container my-5">

        <%--Titulo del formulario--%>
        <div class="row justify-content-center m-2">
            <div class="col col-md-6">
                <h3>Solicitud para desarrollo de proyecto</h3>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col col-md-6">

                <%--Formulario--%>
                <form id="form1" runat="server">

                    <%--1a sección formulario--%>
                    <div class="card my-2">
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre del solicitante" CssClass=""></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblArea" runat="server" Text="Área solicitante" CssClass=""></asp:Label>
                                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblTelefono" runat="server" Text="Teléfono o Red" CssClass=""></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <%--2a sección formulario--%>
                    <div class="card my-2">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <asp:Label ID="lblTipoProyecto" runat="server" Text="Tipo de proyecto"></asp:Label>
                                    <asp:DropDownList ID="ddlTipoProyecto" runat="server" CssClass="form-control">
                                        <asp:ListItem>Seleccionar</asp:ListItem>
                                        <asp:ListItem>Nuevo</asp:ListItem>
                                        <asp:ListItem>Modificar</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblProyecto" runat="server" Text="Proyecto"></asp:Label>
                                    <asp:TextBox ID="txtProyecto" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--3a sección formulario--%>
                    <div class="card my-2">
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblNombreProyecto" runat="server" Text="Nombre del proyecto"></asp:Label>
                                <asp:TextBox ID="txtNombreProyecto" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblObjetivo" runat="server" Text="Objetivo"></asp:Label>
                                <asp:TextBox ID="txtObjetivo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblInformacion" runat="server" Text="Información adjunta"></asp:Label>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
                            </div>
                        </div>
                    </div>

                    <%--4a sección formulario--%>
                    <div class="card my-2">
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblVigencia" runat="server" Text="Vigencia"></asp:Label>
                                <asp:DropDownList ID="ddlVigencia" runat="server" CssClass="form-control">
                                    <asp:ListItem>Seleccionar</asp:ListItem>
                                    <asp:ListItem>Temporal</asp:ListItem>
                                    <asp:ListItem>Indefinido</asp:ListItem>
                                </asp:DropDownList>
                           </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <asp:Label ID="lblFechaInicio" runat="server" Text="Fecha inicio"></asp:Label>
                                    <asp:TextBox ID="txtFechaInicio" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblFechaFinal" runat="server" Text="Fecha final"></asp:Label>
                                    <asp:TextBox ID="txtFechaFinal" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Sección guardar--%>
                    <div class="my-4">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="form-control btn btn-primary" />
                    </div>


                </form>

            </div>
        </div>



    </div>

</body>
</html>
