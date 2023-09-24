<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%
	HttpSession s = request.getSession(false);
	Compte user = (Compte) s.getAttribute("compte");
	
	if(user==null){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devriez vous identifiez d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceuil</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" type='text/css'  rel="stylesheet">
    <style>
        /* Personnalisation du style pour les blocs */
        .custom-card {
            width: 80%;
            max-width: 100%; /* Réduire la largeur des blocs */
            margin: 7%; /* Augmenter l'espacement entre les blocs */
        	background-color: #F6F6F6;
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
        
    </style>
</head>
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 200%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo unique you'/>
			<div class='option'>
				<a href="acceuil.jsp" class='lien' style='color: #027BBE'>
					<span style='margin-left: 50%;'> <svg  xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512" ><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#42738f}</style><path d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg>
				Acceuil</span>
				</a>
				<a href="panier.jsp" class='lien' style='margin-left: 80%; padding-left: 30%;'>
					<span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
					Panier</span>
				</a>
				<% if(user.type!=1){ %>
				<a href="boutique.jsp" class='lien' style='position: absolute; right: -11%;'>
					<span style='margin-left: 50%;'><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z"/></svg>
				Boutique</span>
				</a><%} %>
			</div>
		</nav>
	</header>
	<div style="display: inline;">
		<jsp:include page="./templates/panel.jsp"/>
		
		<%
		

		String url = "jdbc:mysql://localhost:3306/uniqueyou";
		 String user_name = "root";
		 String mdps =  "root";
		 String query, sql ;
		 
		 if(user.type == 3){
			 query = "SELECT * FROM item where type !=3 ";
			 sql = "SELECT COUNT(*) as nbr from item where type != 3";
		 }
		 else{
			 query = "SELECT * FROM item where type = 3";
			 sql = "SELECT COUNT(*) as nbr from item where type = 3";
		 }
		 
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				Statement st = conn.createStatement();
				
				ResultSet rs = st.executeQuery(sql);
				
				ResultSet result = stmt.executeQuery();
				
				if(rs.next()) {	
					int nbr = rs.getInt("nbr");
					int i = 0;
					
		
		%>
		<div style="display: flex; position: absolute; top: 20%; left: 30%; margin-top: 2%">
			<%
		String succes = (String) request.getAttribute("succes");
	    if(succes!=null){
	%>
				<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		        <div class="modal-dialog">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">Message à propos de votre opération</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
		                </div>
		                <div class="modal-body">
		                    <p><%= succes%></p>
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
		                </div>
		           	 </div>
		        	</div>
		   	   </div> <%} %>
			<div class='contenair'>
			<% while(i<nbr){ %>
				<div class="row" style='margin-bottom: 5%;'>
				<% for(int j = 0; i<nbr && j<3; j++){ 
					 result.next();%>
		            <div class="col-md-4">
		                <div class="card custom-card">
		                    <img src="<%= result.getString("image") %>" class="card-img-top" alt="Image 1">
		                      <% if(!result.getBoolean("promotion")){ %>
		                    <div class="card-body">
		                        <h5 class="card-title"><%= result.getString("libelle") %></h5>
		                        <p class="card-text"><%= result.getFloat("prix") %>$</p>
		                        <a style='background-color: #10D4FF; border-color: #10D4FF;' href="details.jsp?id_current=<%= result.getInt("_id") %>" class="btn btn-primary">Détails</a>
		                        <a href="j_achat_item?id_current=<%= result.getInt("_id") %>" style='background-color: #08D140; border-color: #08D140; margin-left: 20%;' class="btn btn-success">Ajouter</a>
		                    </div>
		      				 <%}
		                    else{ %>
		                    <div class="card-body">
		                        <h5 class="card-title"><%= result.getString("libelle") %></h5>
		                        <div style="display: flex; flex-direction: row; justify-content: center">
				                	<p class="card-text" style="color: red; margin-right: 15%;"><%= result.getInt("prix") %>$</p>
				                	<p class="card-text" style=" margin-left: 15%;"><%= result.getInt("prix_promo") %>$</p>
	               				 </div>
		                        <a style='background-color: #10D4FF; border-color: #10D4FF;' href="details.jsp?id_current=<%= result.getInt("_id") %>" class="btn btn-primary">Détails</a>
		                        <a href="j_achat_item?id_current=<%= result.getInt("_id") %>" style='background-color: #08D140; border-color: #08D140; margin-left: 20%;' class="btn btn-success">Ajouter</a>
		                    </div>
	               			
	               				 <%} %>
		                </div>
		            </div> 
			 <% 
			 i++;}%>
			 </div>
			
		<%
			}
				}
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
		</div>
	</div>
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