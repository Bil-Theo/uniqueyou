<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>S'inscrire</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
</head>
<body>
	<jsp:include page="./templates/header.jsp"/>
	<%
	String[] Afrique = {
		    "Afrique du Sud",
		    "Algérie",
		    "Angola",
		    "Bénin",
		    "Botswana",
		    "Burkina Faso",
		    "Burundi",
		    "Cameroun",
		    "Cap-Vert",
		    "République centrafricaine",
		    "Tchad",
		    "Comores",
		    "République du Congo",
		    "République démocratique du Congo",
		    "Djibouti",
		    "Égypte",
		    "Érythrée",
		    "Éthiopie",
		    "Gabon",
		    "Gambie",
		    "Ghana",
		    "Guinée",
		    "Guinée-Bissau",
		    "Guinée équatoriale",
		    "Kenya",
		    "Lesotho",
		    "Liberia",
		    "Libye",
		    "Madagascar",
		    "Malawi",
		    "Mali",
		    "Maroc",
		    "Maurice",
		    "Mauritanie",
		    "Mozambique",
		    "Namibie",
		    "Niger",
		    "Nigeria",
		    "Ouganda",
		    "Rwanda",
		    "Sahara occidental",
		    "Sainte-Hélène",
		    "São Tomé-et-Principe",
		    "Sénégal",
		    "Seychelles",
		    "Sierra Leone",
		    "Somalie",
		    "Soudan",
		    "Soudan du Sud",
		    "Swaziland",
		    "Tanzanie",
		    "Togo",
		    "Tunisie",
		    "Zambie",
		    "Zimbabwe"
		};

	%>
	<h3 class="theme" style='margin-left: 45%;'>Inscription</h3>
	<div class='form-block' style='marigin-bottom: 10%;'>
		<form action='j_security_sign' method='POST' class='form-login'>
			<div class='form-group-sign' style='margin-top: 2%'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Nom du compte <span style='color: red'>*</span></label>
				<input name='j_username' type='text' class='entrer-sign' required placeholder='ex: Guedila'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Créer un mot de passe <span style='color: red'>*</span></label>
				<input name='j_mdps' type='password' class='entrer-sign' required>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Téléphone <span style='color: red'>*</span></label>
				<input name='j_tel' type='text' class='entrer-sign' required required placeholder='ex: 00213779063957'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Adresse email <span style='color: red'>*</span></label>
				<input name='j_email' type='email' class='entrer-sign' required required placeholder='ex: guedila@example.com'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'> Votre localisation <span style='color: red'>*</span></label>
				<div class='localisation'>
					<div class='local'>
						<label class='label-m' style='margin-right: 2%'>Postal</label>
						<input type='number' name='j_postal' class='entrer-local' required placeholder='ex: 35000'>
					</div>
					<div class='local'>
						<label class='label-m'>Ville</label>
						<input type='text' name='j_ville' class='entrer-local' required placeholder='ex: Boumerdes'>
					</div>
					<div class='local'>
						<label class='label-m'>Pays</label>
						<select name="j_pays" id="pays" class='entrer-local' style='color: #8B8B8B'>
							<option disabled selected >Selectionnez votre pays</option>
							<%for(String pays: Afrique){ %>
				               <option value="<%= pays%>"><%= pays%></option>
				            <%} %>
        				</select>
						
					</div>
				</div>
			</div>
			<div class='form-group-sign' style='margin-top: 10%'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Type de compte</label>
				<div style='margin-left: 6%'>
					<input name='j_type' type='radio' class='entrer-sign' value='1' checked>
					<label class='label-m'>Client</label>
					<input name='j_type' type='radio' class='entrer-sign' value='2'>
					<label class='label-m'>Client vendeur</label>
					<input name='j_type' type='radio' class='entrer-sign' value='3'>
					<label class='label-m'>Entreprise</label>
				</div>
			</div>
			<button type="submit" class="btn btn-success" style='margin-left: 30%; margin-top: 18%; border-color: #08D140; background-color: #08D140;'>
				S'inscrire 
				<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffffff}</style><path d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM504 312V248H440c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V136c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H552v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
			</button>
		</form>
	</div>
</body>
</html>
