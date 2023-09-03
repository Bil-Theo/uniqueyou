<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/boostrap.min.css'>
    <%@ include file="./templates/icon.jsp" %>
</head>
<body>
	<jsp:include page="./templates/header.jsp"/>
	<h3 class="theme">Connexion</h3>
	<div class='form-block'>
		<form action='Login' method='POST' class='form-login'>
			<div class='form-group' style='margin-top: 2%'>
				<label>Email ou Téléphone</label>
				<input name='j_username' type='text' class='entrer' required>
			</div>
			<div class='form-group'>
				<label>Mot de passe</label>
				<input name='j_password' type='password' class='entrer' required>
			</div>
			<button type="submit" class="btn">Connexion <svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M217.9 105.9L340.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L217.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1L32 320c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM352 416l64 0c17.7 0 32-14.3 32-32l0-256c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32l64 0c53 0 96 43 96 96l0 256c0 53-43 96-96 96l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32z"/></svg></button>
		</form>
	</div>
	<div class='info'>
		<p class='message' style='margin-left: 8%; color: red; font-size: 120%;'>Mot de passe oublié?</p>
		<p class='message' style='margin-left: 5%;font-size: 120%;'> Nouvel utilisateur ? <a href="Error.jsp">Cliquez ici</a>
	</div>
</body>
</html>
