<%@page import="java.util.ArrayList"%>
<%@page import="com.luis.clases.Producto"%>
<%@page import="com.luis.clases.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listado de productos</title>
</head>
<body>
Hola <%=((Usuario)session.getAttribute("usuario")).getLogin() %> bienvenido
<br />

<table>
<tr>
<td>Nombre</td><td>Precio</td>
</tr>
<%for(Producto pro:(ArrayList<Producto>)application.getAttribute("productos")) {
%>
<tr>
<td><%=pro.getNombre() %></td><td><%=pro.getPrecio() %>€</td>
</tr>
<%} %>
</table>
</body>
</html>