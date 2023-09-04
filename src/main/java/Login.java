

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

/**
 * Servlet implementation class Login
 */
@WebServlet("/j_security_access")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "SELECT * FROM compte WHERE (email = ? or telephone = ?) AND mdps = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("j_username");
		String password = request.getParameter("j_password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user_name, mdps);
			PreparedStatement stmt  =  conn.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, username);
			stmt.setString(3, password);
			
			ResultSet result = stmt.executeQuery();
			if(result.next()) {
				Compte compte = new Compte(result.getInt("_id"), result.getString("nom"), result.getString("telephone"), result.getString("email"), result.getString("mdps"), result.getInt("codePostal"), result.getString("ville"), result.getString("pays"), result.getInt("type"));
				
				HttpSession session = request.getSession();
				session.setAttribute("compte", compte);
				
				if(compte.type==1) {
					response.sendRedirect("Client_Vendeur/acceuil.jsp");
				}
				else if(compte.type==2) {
					response.sendRedirect("Client/acceuil.jsp");
				}
				else {
					response.sendRedirect("Entreprise/acceuil.jsp");
				}
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				request.setAttribute("message", "Télephone ou email ou mot de passe incorrect.");
				rd.forward(request, response);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			request.setAttribute("message", "Erreur liée à la base de données");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			request.setAttribute("message", "Erreur interne. Veuillez contacter le technicien");
			rd.forward(request, response);
		}
		
	}

}
