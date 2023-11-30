

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
 * Servlet implementation class formulaire
 */
@WebServlet("/j_formulaire")
public class myform extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "INSERT INTO formulaire VALUES(null, ?, ?, ?, ?, ?, ?);";
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession(false);
		Compte user = (Compte) s.getAttribute("compte");
		
		if(user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("message", "Vous devenez vous identifiez d'abord avant de faire cette opération");
			rd.forward(request, response);
		}
		else {
			
			String tel = request.getParameter("j_tel");
			String adresse = request.getParameter("j_live");
			String ville = request.getParameter("j_ville");
			String pays = request.getParameter("j_pays");
			String date = request.getParameter("j_date");
			//System.out.print(date);
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				stmt.setString(1, tel);
				stmt.setString(2, adresse);
				stmt.setString(3, ville);
				stmt.setString(4, pays);
				stmt.setString(5, date);
				stmt.setInt(6, user._id);
				
				int res = stmt.executeUpdate();
				if(res>=0) {
					RequestDispatcher rd = request.getRequestDispatcher("acceuil.jsp");
					request.setAttribute("succes", "Votre panier a été valider avec succes.");
					rd.forward(request, response);
					PreparedStatement st  =  conn.prepareStatement("SELECT DISTINCT C2.email as mail_v, C2.nom as nom_v,now() as dte FROM panier P, item i, compte C2 WHERE P.id_user = ? and P.id_item = I._id and I.id_user = C2._id group by C2.email; ");
					PreparedStatement stm = conn.prepareStatement("SELECT distinct I._id, I.libelle, I.prix, I.promotion, I.id_user, I.prix_promo, I.id_user, I.type, count(P.id_item) as qte from panier P, item I where P.id_item = I._id AND P.id_user = ? GROUP by P.id_item ; ");
					stm.setInt(1, user._id);
					
					ResultSet rr = stm.executeQuery();
					
					while(rr.next()) {
						
						PreparedStatement ss = conn.prepareStatement("INSERT INTO commande VALUES(null ,? , ?, ?, ?, ?, ?, ?, ?, ?, 'En-cours', now(), null, ?, ?);");

						ss.setInt(1, Integer.parseInt(rr.getString("I._id")));
						ss.setString(2, rr.getString("I.libelle"));
						ss.setFloat(3, Float.parseFloat(rr.getString("I.prix")));
						ss.setFloat(4, Float.parseFloat(rr.getString("I.prix_promo")));
						ss.setInt(5, Integer.parseInt(rr.getString("I.promotion")));
						ss.setString(6, "./assets/images/database/");
						ss.setString(7, "");
						ss.setInt(8, Integer.parseInt(rr.getString("I.id_user")));
						ss.setInt(9, Integer.parseInt(rr.getString("I.type")));
						ss.setInt(10, user._id);
						ss.setInt(11, Integer.parseInt(rr.getString("qte")));
						
						ss.executeUpdate();
					}
					st.setInt(1, user._id);
					ResultSet r = st.executeQuery();
					
					while(r.next()) {
						
						String body = "Bonjour " + r.getString("nom_v") + ",\r\n"
								+ "\r\n"
								+ "Bonne nouvelle ! \r\n"
								+ "\r\n"
								+ "Une commande a été faite le " + r.getString("dte") + " par " + user.nom +".\r\n"
								+ "\r\n"
								+ "Merci de confirmer ou réjeter les articles commandés. \r\n"
								+ "\r\n"
								+ "Cordialement,\r\n"
								+ "L'équipe unique u";
						String subject = "NE PAS REPONDRE - COMMANDE RECU UNIQUEYOU";
						//String received = r.getString("mail_v");
						String received = "salehindev@gmail.com";
						
						//
						//System.out.println(body);	
						//EnvoyerEmail.envoyer(received, subject, body);
					}
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}




