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
    <title>Tableau bord</title>
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
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Gestion Commandes</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="admin.jsp"><svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000040}</style><path d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z"/></svg></a></h3>
		</nav>
	</header>
	
	<div class="container mt-4">
	<a class="btn btn-primary" href="#" onclick="window.location.reload();" style="margin-Top: 2%; font-weight: bold;">Actualiser</a>
	<h3 class="theme" style="margin-left: 43%; margin-top: 0%">Commandes En-cours</h3>
    <table class="table table-striped">
        <thead>
            <tr>
            	<th scope="col">Vendeur</th>
            	<th scope="col">Client</th>
                <th scope="col">Libellé</th>
                <th scope="col">Quantité</th>
            	<th scope="col">Statut</th>
                <th scope="col">Tel vendeur</th>
                <th scope="col">Email vendeur</th>
                <th scope="col">Pays vendeur</th>
                <th scope="col">Tel client</th>
                <th scope="col">Email client</th>
                <th scope="col">Pays client</th>
            </tr>
        </thead>
        <tbody>
        
        <%
	         String url = "jdbc:mysql://localhost:3306/uniqueyou";
			 String user_name = "root";
			 String mdps =  "root";
			 String query = "SELECT C.libelle, C.statut, C.quantite, C1.nom, C2.nom, C1.email, C2.email, C1.pays, C2.pays, C1.telephone, C2.telephone from commande C, compte C1, compte C2 WHERE C1._id != C2._id AND C1._id = C.id_user AND C2._id = C.id_client AND statut ='En-cours' group by C._id, C2._id, C1._id";
	
			 int i = 0, count = 0;
			 
			 try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection(url, user_name, mdps);
					PreparedStatement stmt  =  conn.prepareStatement(query);
					
					ResultSet result = stmt.executeQuery();
					
					while(result.next()){
        %>
        
            <tr>
            	<td><%= result.getString("C1.nom") %></td>
                <td><%= result.getString("C2.nom") %></td>
                <td><%= result.getString("C.libelle") %></td>
                <td><%= result.getString("C.quantite") %></td>
                <td><%= result.getString("C.statut") %></td>
                <td><%= result.getString("C1.telephone") %> </td>
                <td><%= result.getString("C1.email") %> </td>
                <td><%= result.getString("C1.pays") %> </td>
                <td><%= result.getString("C2.telephone") %> </td>
                <td><%= result.getString("C2.email") %> </td>
                <td><%= result.getString("C2.pays") %> </td>
             </tr>
             <%         		}
					
				}catch(SQLException e) {
					e.printStackTrace();
					RequestDispatcher rd = request.getRequestDispatcher("./templates/error.jsp");
					request.setAttribute("message", "Erreur liée à la base de données");
					rd.forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					RequestDispatcher rd = request.getRequestDispatcher("./templates/error.jsp");
					request.setAttribute("message", "Erreur interne. Veuillez contacter le technicien");
					rd.forward(request, response);
				}
		%>
        </tbody>
    </table>
</div>

	<script type="text/javascript" src='./assets/scripts/bascrypt.js'></script>
</body>
</html>