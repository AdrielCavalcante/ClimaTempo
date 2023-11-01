<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java web test</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<main>
<h1>Consultar Clima</h1>
<form action="ConsultaClima" method="POST">
	<label for="texto">Insira o nome de uma cidade:</label>
	<input type="text" id="cidade" name="cidade" required>
	<button type="submit">Enviar</button>
</form>
</main>
</body>
</html>