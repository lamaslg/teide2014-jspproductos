<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listado de productos</title>
</head>
<body>

Hola ${usuario.login} bienvenido

<table>
<tr>
<td>Nombre</td><td>Precio</td>
</tr>
<c:forEach items="${productos}" var="producto">
	<tr>
		<td>
		<c:out value="${producto.nombre}" default="Producto desconocido"/>
		</td>
		
		<c:choose>
			<c:when test="${producto.precio<200}">
				<td style="color: green;">
					<fmt:formatNumber value="${producto.precio}" currencySymbol="€"
						type="currency" 	/>
				</td>		
			</c:when>
			<c:when test="${producto.precio<400}">
				<td style="color: blue;">
				<fmt:formatNumber value="${producto.precio}"
					type="currency" 	/>
				
</td>		
			</c:when>
			<c:otherwise>
				<td style="color: red;">

					<fmt:formatNumber value="${producto.precio}"
					type="currency" 	/>
				
</td>		
			
			</c:otherwise>
		</c:choose>
		<td>
			
		
		</td>
	</tr>
</c:forEach>
</table>
</body>
</html>