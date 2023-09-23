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
    <title>Details</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Détails produit</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="javascript:history.back()">Retour <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg></a></h3>
		</nav>
	</header>
	
	<%
		

		 String url = "jdbc:mysql://localhost:3306/uniqueyou";
		 String user_name = "root";
		 String mdps =  "root";
		 String query = "SELECT * FROM item WHERE _id = ?;";
		 
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				
				int i = Integer.parseInt(request.getParameter("id_current"));
				System.out.println(i);
				
				stmt.setInt(1, i);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()){
				
		%>
	
	<div class='form-block' style='margin-top: 1%;'>
		<div class="container mt-5" style="display: flex; flex-direction: row; justify-content: center; margin-bottom: 5%;">
       	 	<div class="card" style="width: 18rem; background-color: #F6F6F6;" >
            	<img src="./assets/images/database/photo.jpg" class="card-img-top" alt="Image du produit">
            	<% if(!rs.getBoolean("promotion")){ %>
            	<div class="card-body">
	                <h5 class="card-title" style="display: flex; flex-direction: row; justify-content: center"><%= rs.getString("libelle") %></h5>
	                <p class="card-text" style="display: flex; flex-direction: row; justify-content: center"><%= rs.getInt("prix") %></p>
	                <p class="card-text" style="display: flex; flex-direction: row; justify-content: center"><%= rs.getString("description") %></p>
	                <a href="j_achat_item?<%= rs.getInt("_id") %>" class="btn btn-primary" style='background-color: #08D140; border-color: #08D140; margin-left: 35%;'>Ajouter</a>	
	            </div>
	            <% } 
            	else{ %>
            	<div class="card-body">
	                <h5 class="card-title" style="display: flex; flex-direction: row; justify-content: center"><%= rs.getString("libelle") %></h5>
	                <div style="display: flex; flex-direction: row; justify-content: center">
	                	<p class="card-text" style="color: red; margin-right: 15%;"><%= rs.getInt("prix") %>$</p>
	                	<p class="card-text" style=" margin-left: 15%;"><%= rs.getInt("prix_promo") %>$</p>
	                </div>
	                <p class="card-text" style="display: flex; flex-direction: row; justify-content: center"><%= rs.getString("description") %></p>
	                <a href="j_achat_item?<%= rs.getInt("_id") %>" class="btn btn-primary" style='background-color: #08D140; border-color: #08D140; margin-left: 35%;'>Ajouter</a>	
	            </div>
	           <%} %>
        	</div>
        </div>
    </div>

	<% }		
			}catch(SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 %>

	<script type="text/javascript" src='./assets/scripts/bascrypt.js'></script>
</body>
</html>