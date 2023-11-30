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
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Tableau de bord</h3>
			<h3 h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="boutique.jsp"><svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000040}</style><path d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z"/></svg></a></h3>
		</nav>
	</header>
	
	<div class="container mt-4">
	<a class="btn btn-primary" href="#" onclick="window.location.reload();" style="margin-Top: 2%; font-weight: bold;">Actualiser</a>
	<a class="btn btn-primary" href="statistiques.jsp" style="margin-Top: 2%; font-weight: bold; margin-left: 75%;">Mes finalisations</a>
	<h3 class="theme" style="margin-left: 43%; margin-top: 0%">Commandes</h3>
    <table class="table table-striped">
        <thead>
            <tr>
            	 <th scope="col">Client</th>
                <th scope="col">Libellé</th>
                <th scope="col">Quantité</th>
                <th scope="col">Téléphone</th>
                <th scope="col">Pays</th>
                <th scope="col">Adresse</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
        
        <%
	         String url = "jdbc:mysql://localhost:3306/uniqueyou";
			 String user_name = "root";
			 String mdps =  "root";
			 String query = "SELECT U.nom, I.libelle, I._id, P._id, F.adresse, F.pays, F.ville, F.telephone, I.quantite as qte FROM Panier P, Compte U, commande I, formulaire F WHERE P.id_user = U._id AND P.id_item = I._id AND F.id_user = P.id_user AND I.id_user = ? AND I.statut ='En-cours' group by P.id_item, P.id_user ";
	
			 int i = 0, count = 0;
			 
			 try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection(url, user_name, mdps);
					PreparedStatement stmt  =  conn.prepareStatement(query);
					stmt.setInt(1, user._id);
					
					ResultSet result = stmt.executeQuery();
					
					while(result.next()){
        %>
        
            <tr>
            	<td><%= result.getString("U.nom") %></td>
                <td><%= result.getString("I.libelle") %></td>
                <td><%= result.getString("qte") %></td>
                <td><%= result.getString("F.telephone") %></td>
                <td><%= result.getString("F.pays") %></td>
                <td><%= result.getString("F.adresse")+"  "+result.getString("F.ville") %> </td>
                <td>
                	<div class="row">
                        <a href="valide?id_current=<%= result.getInt("P._id") %>&&action=1&&item=<%= result.getInt("I._id") %>" class="col">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                        </a>
                        <a href="valide?id_current=<%= result.getInt("P._id") %>&&action=0&&item=<%= result.getInt("I._id") %>" class="col">
                            <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/></svg>
                        </a>
                    </div>
                </td>
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
    <div style="display: flex; flex-direction: row; justify-content: center">
    	<a href="valide?action=1" class="btn btn-success" style="color: white; font-weight: bold; background-color: #08D140; border-color: #08D140;">Tout valider</a>
    	<a href="valide?action=0" class="btn btn-danger" style="margin-left: 20%;color: white; font-weight: bold; background-color: #FF0000; border-color: #FF0000;">Tout réfuser</a>
    </div>
</div>

	<script type="text/javascript" src='./assets/scripts/bascrypt.js'></script>
</body>
</html>