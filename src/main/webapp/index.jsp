<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clima Tempo</title>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<main>
	<h1>Consultar Clima</h1>
	<!-- Button trigger modal -->
	<button type="button" class="d-flex mx-auto btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  Consultar
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Consulta de clima tempo</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="ConsultaClima" method="POST">
		      <div class="modal-body">
					<label for="cidade" class="form-label">Insira o nome de uma cidade:</label>
					<input class="form-control" type="text" id="cidade" name="cidade" required>
			      	<p>Cansado de preencher esse campo? Cadastre-se: <a href="cadastro.jsp">Cadastro</a></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="submit" class="btn btn-primary">Consultar</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
</main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>