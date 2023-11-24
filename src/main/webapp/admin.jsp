<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	HttpSession s = request.getSession(false);
	Compte compte = (Compte) s.getAttribute("compte");
	
	if(compte==null || compte.type!=4){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devenez vous identifiz d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
%>

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
    int totalclient = getTotalClients(connection);

    // Fermer la connexion
    connection.close();
    
    Date datef = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY   HH:mm:ss");
    String date = sdf.format(datef);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Unique you</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="update_account.jsp">Compte</a></li>
                        <li><a class="dropdown-item" href="apropos.jsp">A propos</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="deconnexion.jsp">Deconnexion</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Action</div>
                            <a class="nav-link" href="commandes.jsp">
                                Commandes en cours
                            </a>
                            <a class="nav-link" href="final.jsp">
                                Commandes finalisées
                            </a>
                            <a class="nav-link" href="item.jsp">
                               Tous les articles
                            </a>
                            <a class="nav-link" href="compte.jsp">
                                Tous les comptes
                            </a>
                            
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small"></div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Données</h1>
                        
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                            <div class="card-header">
                                Commandes En cours
                            </div>
                            <div class="card-body"><h3><%= nbCommandesEnCours %></h3></div>
                            <div class="card-footer small text-muted">Mise à jour <%= date %></div>
                        </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        Tous les comptes
                                    </div>
                                    <div class="card-body"><h3><%= totalclient %></h3></div>
                                    <div class="card-footer small text-muted">Mise à jour <%= date %></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        Commandes finalisées
                                    </div>
                                    <div class="card-body"><h3><%= nbrfinal %></h3></div>
                                    <div class="card-footer small text-muted">Mise à jour <%= date %></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        Tous les articles
                                    </div>
                                    <div class="card-body"><h3><%= totalArticlesEnLigne %></h3></div>
                                    <div class="card-footer small text-muted">Mise à jour <%= date %></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
    </body>
</html>

<%!
    // Fonctions pour obtenir les statistiques de ventes depuis la base de données

    private int getNbCommandes(Connection connection, String statut, int id) throws SQLException {
        String query = "SELECT COUNT(*) AS nbCommandes FROM commande WHERE statut = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, statut);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("nbCommandes");
                }
            }
        }
        return 0;
    }

	private int getNbCommandesFinal(Connection connection, String statut, int id) throws SQLException {
    String query = "SELECT COUNT(*) AS nbCommandes FROM commande WHERE statut = ? AND date_cmd >= (NOW() - INTERVAL 5 DAY); ";
    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setString(1, statut);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("nbCommandes");
            }
        }
    }
    return 0;
}

    private int getTotalArticlesEnLigne(Connection connection, int id) throws SQLException {
        String query = "SELECT count(*) AS totalArticles FROM item";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("totalArticles");
            }
        }
        return 0;
    }
    
    private int getTotalClients(Connection connection)throws SQLException {
        String query = "SELECT count(*) AS totalclients FROM compte";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("totalclients") - 1;
            }
        }
        return 0;
    }
%>
