<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Formulaire</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="javascript:history.back()">Retour <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg></a></h3>
		</nav>
	</header>
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
	<h3 class="theme" style='margin-left: 40%;'>Formulaire livraison</h3>
	<div class='form-block' style='marigin-bottom: 10%;'>
		<form action='j_formulaire' method='POST' class='form-login'>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Téléphone <span style='color: red'>*</span></label>
				<input name='j_tel' type='text' class='entrer-sign' required required placeholder='ex: 00213779063957'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Adresse de livraison <span style='color: red'>*</span></label>
				<input name='j_live' type='text' class='entrer-sign' required required placeholder='ex: 22 avenue du 1er novembre ex-inh'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'> Pays de livraison <span style='color: red'>*</span></label>
				<select name="j_pays" id="pays" class='entrer-local' style='color: #8B8B8B; width: 100%;' required>
							<option disabled selected >Selectionnez votre pays</option>
							<%for(String pays: Afrique){ %>
				               <option value="<%= pays%>"><%= pays%></option>
				            <%} %>
        				</select>
			</div>
			<div class='form-group-sign' style='margin-top: 10%'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Ville de livraison<span style='color: red'>*</span></label>
				<input name='j_ville' type='text' class='entrer-sign' required required placeholder='ex: Brazzaville'>
				
			</div>
			<div class='form-group-sign' style='margin-top: 10%; margin-bottom: 10%'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Date de livraison souhaitée</label>
				<input name='j_date' type='date' class='entrer-sign'  placeholder='ex: Brazzaville'>
				
			</div>
			<center>
			<button type="submit" class="btn btn-primary" style="color: white; font-weight: bold; background-color: #08D140; border-color: #08D140;">
				Valider 
			</button></center>
		</form>
	</div>
</body>
</html>
