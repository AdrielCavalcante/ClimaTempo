<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resposta</title>
</head>
<body>
<% 
String resposta = (String) session.getAttribute("respostaAPI"); 
%>
	<h1>Resultado da consulta:</h1>
	<div id="imageContainer"></div>
<script>
    let jsonString = '<%= resposta %>';
    let weatherData = JSON.parse(jsonString);
    
    document.write("<p>Nome da Cidade: " + weatherData.name + "</p>");
    document.write("<p>Temperatura: " + (weatherData.main.temp - 273.15).toFixed(2) + " °C</p>");
    document.write("<p>Descrição: " + weatherData.weather[0].description + "</p>");
    document.write("<p>Umidade: " + weatherData.main.humidity + "%</p>");
    // Adicione mais campos conforme necessário
    var image = document.createElement("img");

        // Defina o atributo 'src' com o URL da imagem
        image.src = "https://openweathermap.org/img/wn/"+ weatherData.weather[0].icon +"@2x.png";

        // Defina o atributo 'alt' (texto alternativo) para acessibilidade
        image.alt = "Descrição da imagem";

        // Adicione a imagem ao elemento de contêiner na página
        document.getElementById("imageContainer").appendChild(image);
</script>

<a href="index.jsp"><button>Voltar</button></a>
</body>
</html>