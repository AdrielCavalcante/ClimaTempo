<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resposta</title>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<% 
String resposta = (String) session.getAttribute("respostaAPI"); 
String respostaPrevisao = (String) session.getAttribute("respostaAPIdias"); 
%>
	<h1>Previsão do tempo de hoje:</h1>
	<div class="d-flex align-items-center flex-column mx-auto gap-3">
		<div class="card" style="width: 18rem; background-color: rgba(225, 211, 211, 0.75);">
		  <div id="imageContainer" class="d-flex mx-auto"></div>
		  <div class="card-body" id="card">
		  	<h5 class='card-title' id="card-title" style="text-align: center;"></h5>
		  	 <ul class="list-group list-group-flush">
			    <li class="list-group-item" id="item-1"><b>Temperatura: </b></li>
			    <li class="list-group-item" id="item-2"><b>Clima: </b></li>
			    <li class="list-group-item" id="item-3"><b>Umidade: </b></li>
			 </ul>
		  </div>
		</div>
		<script>
			let notFound = false;
		    let jsonString = '<%= resposta %>';

		    if(jsonString == "Cidade não encontrada") {
		    	document.write("<strong>Cidade não encontrada, tente novamente</strong>");
		    	notFound = true;
		    } else {
		    	
			    let weatherData = JSON.parse(jsonString);
			    
			    let cidade = document.createTextNode(weatherData.name);
			    let temperatura = document.createTextNode((weatherData.main.temp - 273.15).toFixed(2) + " °C");
			    let clima = document.createTextNode( weatherData.weather[0].description);
			    let umidade = document.createTextNode(weatherData.main.humidity + "%");
			    
			    const cardTitle = document.getElementById('card-title');
			    const cardCampo1 = document.getElementById('item-1');
			    const cardCampo2 = document.getElementById('item-2');
			    const cardCampo3 = document.getElementById('item-3');
			    
			    cardTitle.appendChild(cidade);
			    cardCampo1.appendChild(temperatura);
			    cardCampo2.appendChild(clima);
			    cardCampo3.appendChild(umidade);
			    
			    
			    // Adicione mais campos conforme necessário
			    var image = document.createElement("img");
		
		        // Defina o atributo 'src' com o URL da imagem
		        image.src = "https://openweathermap.org/img/wn/"+ weatherData.weather[0].icon +"@2x.png";
		
		        // Defina o atributo 'alt' (texto alternativo) para acessibilidade
		        image.alt = "Descrição da imagem";
		
		        // Adicione a imagem ao elemento de contêiner na página
		        document.getElementById("imageContainer").appendChild(image);
		    }
		    
		    let jsonPrevisao = '<%= respostaPrevisao %>';
		    if(jsonPrevisao == "Cidade não encontrada" && !notFound) {
		    	document.write("<strong>Cidade não encontrada, tente novamente</strong>");
		    } else {
		    	let forecastData = JSON.parse(jsonPrevisao);
		    	console.log(forecastData);
		    }
		</script>

		<a href="index.jsp"><button type="button" class="btn btn-secondary">Voltar</button></a>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>