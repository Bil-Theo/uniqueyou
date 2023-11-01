

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilitaires.Compte;

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
			System.out.print(date);
			
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
				System.out.print("ca marche");
				if(res>=0) {
					RequestDispatcher rd = request.getRequestDispatcher("acceuil.jsp");
					request.setAttribute("succes", "Votre panier a été valider avec succes.");
					rd.forward(request, response);
					PreparedStatement st  =  conn.prepareStatement("DELETE FROM panier WHERE id_user = ?");
					
					st.setInt(1, user._id);
					//st.executeUpdate();
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
