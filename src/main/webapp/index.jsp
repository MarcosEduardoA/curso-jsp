<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<title>Curso JSP</title>
	
	<style type="text/css">
		form {
			position: absolute;
			top: 40%;
			left: 33%;
			right: 33%;
		}
		
		.msg {
			position: absolute;
			top: 20%;
			left: 33%;
			right: 33%;
			font-size: 15px;
			color: #FFF;
		    background-color: #8B0000;
		    border-color: #8B0000;
		    text-align: center;
		}
		
		h5 {
			position: absolute;
			top: 30%;
			left: 33%;
			right: 33%;
		}
	</style>
</head>
<body>

	<h5>Bem vindo ao curso de jsp!</h5>
	
	<form action="ServletLogin" method="post" class="row g-3 needs-validation" novalidate>
	
	<input type="hidden" value="<%= request.getParameter("url") %>" name="url">

		<div class="mb-3">
			<label class="form-label" for="login">Login:</label>
			<input class="form-control" id="login" name="login" type="text" required>
			<div class="invalid-feedback">
      			Obrigat�rio
    		</div>
    		<div class="valid-feedback">
      			ok
    		</div>
		</div>
		
		<div class="mb-3">
			<label class="form-label" for="senha">Senha:</label>
			<input class="form-control" id="senha" name="senha" type="password" required>
			<div class="invalid-feedback">
      			Obrigat�rio
    		</div>
    		<div class="valid-feedback">
      			ok
    		</div>
		</div>
		
			<input type="submit" value="Acessar" class="btn btn-primary">
		
	</form>
	
	<h5 class="msg">${msg}</h5>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
	</script>
</body>
</html>