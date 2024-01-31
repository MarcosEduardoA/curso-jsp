<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tela de erros</title>
</head>
<body>
	<h1 style="color: #FF0000">Erro!!! Entre em contato com a equipe de suporte.</h1>
	
	<%
		out.print(request.getAttribute("msg"));
	%>
</body>
</html>