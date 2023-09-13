
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelado.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listaProducto") == null){
        ArrayList<Producto> lisaux = new ArrayList<Producto>();
        session.setAttribute("listaProducto",lisaux);
    }
    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("listaProducto");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    </style>
    </head>
    <body>
        <table border="5" cellspacing="0" alaing>
            <tr>
                <th>Primer Parcial TEM-742<br>Nombre: Nelson Mamani Ramos<br>Carnet: 13085381</th>
            </tr>
        </table>

        <h1>Gestión de productos</h1>
        <p><a href="MainServlet?op=nuevo">Nuevo producto</a></p>
        <table border="1" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Descripción</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <%
            if (lista != null) {
                for(Producto item : lista){
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getDescripcion() %></td>
                <td><%= item.getCantidad() %></td>
                <td><%= item.getPrecio() %></td>
                <td><%= item.getCategoria() %></td>
                <td><a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>" onclick="return(confirm('Esta seguro de eliminar?'))">Eliminar</a></td>
            </tr>
            <%
                }
            }
            %>
        </table>
    </body>
</html>
