<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%
	HttpSession s = request.getSession(false);
	Compte compte = (Compte) s.getAttribute("compte");
	
	if(compte==null){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devenez vous identifiz d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Statistiques</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    // Définir les informations de connexion à la base de données
  
     String url = "jdbc:mysql://localhost:3306/uniqueyou";
	 String user = "root";
	 String password =  "root";

    // Établir la connexion à la base de données
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, user, password);

    // Obtenir le nombre de commandes en cours
    int nbCommandesEnCours = getNbCommandes(connection, "En-cours", compte._id);

    // Obtenir le nombre de commandes finalisées
    int nbrfinal = getNbCommandesFinal(connection, "Finale", compte._id);

    // Obtenir le nombre total d'articles en ligne
    int totalArticlesEnLigne = getTotalArticlesEnLigne(connection, compte._id);

    // Fermer la connexion
    connection.close();
%>
<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Mes statistiques</h3>
			<h3 class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="tableaubord.jsp"><svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000040}</style><path d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z"/></svg></a></h3>
		</nav>
</header>

<div class="container mt-5">
    <center><h1 class="mb-4">Statistiques de Ventes</h1></center>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Commandes en cours</h5>
                    <p class="card-text"><%= nbCommandesEnCours %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Commandes finalisées</h5>
                    <p class="card-text"><%= nbrfinal %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Articles en ligne</h5>
                    <p class="card-text"><%= totalArticlesEnLigne %></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Ajouter le script Bootstrap (utilisez la CDN ou incluez localement) -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>

<%!
    // Fonctions pour obtenir les statistiques de ventes depuis la base de données

    private int getNbCommandes(Connection connection, String statut, int id) throws SQLException {
        String query = "SELECT COUNT(*) AS nbCommandes FROM commande WHERE statut = ? AND id_user = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, statut);
            preparedStatement.setInt(2, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("nbCommandes");
                }
            }
        }
        return 0;
    }

	private int getNbCommandesFinal(Connection connection, String statut, int id) throws SQLException {
    String query = "SELECT COUNT(*) AS nbCommandes FROM commande WHERE statut = ? AND id_user = ? AND date_cmd >= (NOW() - INTERVAL 4 DAY)";
    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setString(1, statut);
        preparedStatement.setInt(2, id);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("nbCommandes");
            }
        }
    }
    return 0;
}

    private int getTotalArticlesEnLigne(Connection connection, int id) throws SQLException {
        String query = "SELECT count(*) AS totalArticles FROM item WHERE id_user = "+id;
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("totalArticles");
            }
        }
        return 0;
    }
%>
