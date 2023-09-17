<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%
	HttpSession s = request.getSession(false);
	Compte user = (Compte) s.getAttribute("compte");
	
	if(user==null){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devenez vous identifiz d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Compte</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Mon compte</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="javascript:history.back()">Retour <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg></a></h3>
		</nav>
	</header>
	<%
	String[] Afrique = {
		    "Afrique du Sud",
		    "Algerie",
		    "Angola",
		    "Benin",
		    "Botswana",
		    "Burkina Faso",
		    "Burundi",
		    "Cameroun",
		    "Cap-Vert",
		    "Republique centrafricaine",
		    "Tchad",
		    "Comores",
		    "Republique du Congo",
		    "Republique democratique du Congo",
		    "Djibouti",
		    "Egypte",
		    "Erythree",
		    "Ethiopie",
		    "Gabon",
		    "Gambie",
		    "Ghana",
		    "Guinee",
		    "Guinee-Bissau",
		    "Guinee équatoriale",
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
		    "Sao Tome-et-Principe",
		    "Senegal",
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
	
	<%
		

		 String url = "jdbc:mysql://localhost:3306/uniqueyou";
		 String user_name = "root";
		 String mdps =  "root";
		 String query = "SELECT * FROM compte WHERE _id =  ?";
		 
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				
				stmt.setInt(1, user._id);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()){
				
		%>
	
	<div class='form-block' style='marigin-bottom: 10%; margin-top: 3%'>
		<form action='j_security_account' method='POST' class='form-login'>
			<input value="<%= user._id%>" style="display: none;" name="j_id">
			<div class='form-group-sign' style='margin-top: 2%'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Nom du compte <span style='color: red'>*</span></label>
				<input value="<%= rs.getString("nom") %>" name='j_username' type='text' class='entrer-sign' required placeholder='ex: Guedila'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Créer un mot de passe <span style='color: red'>*</span></label>
				<input value="<%= rs.getString("mdps") %>"  name='j_mdps' type='password' class='entrer-sign' required>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Téléphone <span style='color: red'>*</span></label>
				<input value="<%= rs.getString("telephone") %>"  name='j_tel' type='text' class='entrer-sign' required required placeholder='ex: 00213779063957'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'>Adresse email <span style='color: red'>*</span></label>
				<input value="<%= rs.getString("email") %>"  name='j_email' type='email' class='entrer-sign' required required placeholder='ex: guedila@example.com'>
			</div>
			<div class='form-group-sign'>
				<label class='label-m' style='font-weight: bold; font-size: 100%;'> Votre localisation <span style='color: red'>*</span></label>
				<div class='localisation'>
					<div class='local'>
						<label class='label-m' style='margin-right: 2%'>Postal</label>
						<input value="<%= rs.getInt("codePostal") %>"  type='number' name='j_postal' class='entrer-local' required placeholder='ex: 35000'>
					</div>
					<div class='local'>
						<label class='label-m'>Ville</label>
						<input value="<%= rs.getString("ville") %>"  value="<%= rs.getString("nom") %>"  type='text' name='j_ville' class='entrer-local' required placeholder='ex: Boumerdes'>
					</div>
					<div class='local'>
						<label class='label-m'>Pays</label>
						<select name="j_pays" id="pays" class='entrer-local' style='color: #8B8B8B'>
							<option value="<%= rs.getString("pays") %>" ><%= rs.getString("pays") %></option>
							<%for(String pays: Afrique){ %>
				               <option value="<%= pays%>"><%= pays%></option>
				            <%} %>
        				</select>
						
					</div>
				</div>
			</div>
			<button type="submit" class="mbtn" style='margin-left: 25%; background-color: #10D4FF'>
				Modifier 
			</button>
		</form>
	
	</div>
		<% }		
			}catch(SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 %>
</body>
</html>
