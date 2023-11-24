<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%
	HttpSession s = request.getSession(false);
	Compte user = (Compte) s.getAttribute("compte");
	
	if(user==null || user.type!=4){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devriez vous identifiez d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tous les articles</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" type='text/css'  rel="stylesheet">
    <style>
        /* Personnalisation du style pour les blocs */
        .custom-card {
            width: 50px;
            max-width: 50px%; /* Réduire la largeur des blocs */
            margin: 1%; /* Augmenter l'espacement entre les blocs */
        	background-color: #F6F6F6;
        	position: relative;
        	left: 10%;
        }
        .card-title{
        	display: flex;
        	flex-direction: row;
        	justify-content: center;
        }
        .card-text{
        	display: flex;
        	flex-direction: row;
        	justify-content: center;
        }
        
        .panel{
        	width: 3%;
        	max-width: 20%;
        	display: flex;
        	flex-direction: row;
        	justify-content: center;
        	margin-bottom: 2%;
        }
    </style>
</head>
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Tous les articles</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="admin.jsp"><svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000040}</style><path d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z"/></svg></a></h3>
		</nav>
	</header>
	
	    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Libellé</th>
                    <th>Vendeur</th>
                    <th>Email vendeur</th>
                    <th>Prix Unitaire</th>
                </tr>
            </thead>		
            <tbody>
                <%
		

		 String url = "jdbc:mysql://localhost:3306/uniqueyou";
		 String user_name = "root";
		 String mdps =  "root";
		 String query = "SELECT I.image, I.libelle, C.nom, C.email, I.prix, I.promotion, prix_promo from item I, compte C WHERE I.id_user = C._id order by I._id desc";

		int i = 0, count = 0;
		 
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				
				ResultSet result = stmt.executeQuery();
				
				while(result.next()){
					float prix, prix_t;
					prix = (result.getInt("I.promotion")==1)? result.getFloat("prix_promo"):result.getFloat("I.prix");
					
			
		%>
                <tr>
                    <td><img src="<%= result.getString("I.image") %>" alt="Image 1" width="50" height="50"></td>
                    <td><%= result.getString("I.libelle") %></td>
                    <td><%= result.getString("C.nom") %></td>
                    <td><%= result.getString("C.email") %></td>
                    <td><%= prix%>$</td>
                </tr>
         <%
				i++;}%>
            </tbody>
        </table>
        
        <div style="display: flex; flex-direction: row; justify-content: center; margin-top: 5%">
					<p style="margin-left: -10%">Total articles: </p> <p style="margin-left: 2%; font-weight: bold; margin-right: 5%;"><%=i %></p>
		</div>
        
        
    </div>
				
				
	<% 	}catch(SQLException e) {
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
		
		
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script>
	document.addEventListener("DOMContentLoaded", function () {
        var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
            backdrop: 'static',
            keyboard: false
        });

        myModal.show();
    });
	</script>
</body>
</html>