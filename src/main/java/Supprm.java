

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
 * Servlet implementation class Supprm
 */
@WebServlet("/vider_panier")
public class Supprm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "DELETE FROM panier WHERE _id = ? AND id_user = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supprm() {
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
			
			int _id = Integer.parseInt(request.getParameter("id_current"));
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				stmt.setInt(1, _id);
				stmt.setInt(2, user._id);
				
				int res = stmt.executeUpdate();
				if(res>=0) {
					RequestDispatcher rd = request.getRequestDispatcher("panier.jsp");
					request.setAttribute("succes", "Suppression reussie avec succes.");
					rd.forward(request, response);
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
