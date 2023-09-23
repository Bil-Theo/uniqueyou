

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
 * Servlet implementation class valide
 */
@WebServlet("/valide")
public class accepte extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "DELETE P\r\n"
			+ "FROM panier AS P\r\n"
			+ "INNER JOIN item AS I ON I._id = P.id_item\r\n"
			+ "WHERE I.id_user = ? AND P._id = ?;\r\n"
			+ " ";
       
    /**
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
			
			int _id = Integer.parseInt(request.getParameter("id_current"));
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				stmt.setInt(1, user._id);
				stmt.setInt(2, _id);
				
				int res = stmt.executeUpdate();
				if(res>=0) {
					RequestDispatcher rd = request.getRequestDispatcher("tableaubord.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	HttpSession s = request.getSession(false);
		HttpSession s = request.getSession(false);
		Compte user = (Compte) s.getAttribute("compte");
		
		if(user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("message", "Vous devenez vous identifiez d'abord avant de faire cette opération");
			rd.forward(request, response);
		}
		else {
			
			String sql= "DELETE P\r\n"
					+ "FROM panier AS P\r\n"
					+ "INNER JOIN item AS I ON I._id = P.id_item\r\n"
					+ "WHERE I.id_user = ? ;\r\n"
					+ " ";
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(sql);
				stmt.setInt(1, user._id);
				
				int res = stmt.executeUpdate();
				if(res>=0) {
					RequestDispatcher rd = request.getRequestDispatcher("tableaubord.jsp");
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
