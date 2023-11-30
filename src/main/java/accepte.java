

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilitaires.Compte;
import utilitaires.EnvoyerEmail;

/**
 * Servlet implementation class valide
 */
@WebServlet("/valide")
public class accepte extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private  String query =  "DELETE P\r\n"
			+ "FROM panier AS P\r\n"
			+ "INNER JOIN item AS I ON I._id = P.id_item\r\n"
			+ "WHERE I.id_user = ? AND P.id_item = ?;\r\n" 
			+ " ";
       
	private String requete = "SELECT Distinct U.email, U.nom, C.libelle, now() as dte  FROM compte U, commande C, panier P WHERE P.id_item = C._id AND U._id = P.id_user AND C.id_user = ? AND P.id_item = ? ";
	private String rqt = "UPDATE commande SET statut = 'Finale', decision = ? WHERE id_user = ? AND  _id = ? ";
	  /**"
     * @see HttpServlet#HttpServlet()
     */
    public accepte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession(false);
		Compte user = (Compte) s.getAttribute("compte");
		
		if(user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("message", "Vous devenez vous identifiez d'abord avant de faire cette opération");
			rd.forward(request, response);
		}
		else {
			int _id = 0;
			int item = 0;
			
			if(request.getParameter("id_current")!=null) {
				_id = Integer.parseInt(request.getParameter("id_current"));
				item = Integer.parseInt(request.getParameter("item"));
			}
			else {
				query =  "DELETE P\r\n"
						+ "FROM panier AS P\r\n"
						+ "INNER JOIN item AS I ON I._id = P.id_item\r\n"
						+ "WHERE I.id_user = ? AND ? = 0;\r\n;"
						+ " ";
				requete = "SELECT Distinct U.email, U.nom, C.libelle, now() as dte  FROM compte U, commande C, panier P WHERE P.id_item = C._id AND U._id = P.id_user AND C.id_user = ? AND 0 = ?; ";
				rqt = "UPDATE commande SET statut = 'Finale', decision = ? WHERE id_user = ? AND  ? = 0 AND statut = 'En-cours'";
			}
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				
				PreparedStatement ss  =  conn.prepareStatement(requete);
				PreparedStatement z = conn.prepareStatement(rqt);
				int action = Integer.parseInt(request.getParameter("action"));
				ss.setInt(1, user._id);
				ss.setInt(2, item);
				
				z.setInt(1, action);
				z.setInt(2, user._id);
				z.setInt(3, item);
				
				z.executeUpdate();
				
				ResultSet r = ss.executeQuery();
				
				 String body;

				 String subject = "NE PAS REPONDRE - COMMANDE ACCEPTE UNIQUEYOU";
				
				while(r.next()) {
					
					if(action==1) {
						
						body = "Bonjour " + r.getString("U.nom") + ",\r\n"
								+ "\r\n"
								+ "Bonne nouvelle ! \r\n"
								+ "\r\n"
								+ "La commande de l'article  " + r.getString("libelle") + " a été validé le  " + r.getString("dte") +".\r\n"
								+ "\r\n"
								+ "La livraison sera effectuée dans le plus bref delai. \r\n"
								+ "\r\n"
								+ "Cordialement,\r\n"
								+ "L'équipe unique u";
						
					}
					else {
						body = "Bonjour " + r.getString("U.nom") + ",\r\n"
								+ "\r\n"
								+ "Bonne nouvelle ! \r\n"
								+ "\r\n"
								+ "La commande de l'article  " + r.getString("libelle") + " a été réjété le  " + r.getString("dte") +".\r\n"
								+ "\r\n"
								+ "La livraison ne sera pas effectuée. \r\n"
								+ "\r\n"
								+ "Cordialement,\r\n"
								+ "L'équipe unique u";
						subject = "NE PAS REPONDRE - COMMANDE REJETE UNIQUEYOU";
					}
					
					//String received = r.getString("mail_v");
					String received = "impressioninh@gmail.com";
					
					//
					//System.out.println(body);	
					//EnvoyerEmail.envoyer(received, subject, body);
				}
				
				PreparedStatement stmt  =  conn.prepareStatement(query);
				
				
				stmt.setInt(1, user._id);
				stmt.setInt(2, _id);
				
				stmt.executeUpdate();
				
				
					
				
					
					
					RequestDispatcher rd = request.getRequestDispatcher("boutique.jsp");
					request.setAttribute("succes", "Suppression reussie avec succes.");
					rd.forward(request, response);}
				
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
