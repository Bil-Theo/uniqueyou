

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
 * Servlet implementation class Signup
 */
@WebServlet("/j_security_sign")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "INSERT INTO compte VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?)";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user_name, mdps);
			PreparedStatement stmt  =  conn.prepareStatement(query);
			stmt.setString(1, request.getParameter("j_username"));
			stmt.setString(2, request.getParameter("j_tel"));
			stmt.setString(3, request.getParameter("j_email"));
			stmt.setInt(4, Integer.parseInt(request.getParameter("j_postal")));
			stmt.setString(5, request.getParameter("j_ville"));
			stmt.setString(6, request.getParameter("j_pays"));
			stmt.setInt(7, Integer.parseInt(request.getParameter("j_type")));
			stmt.setInt(8, Integer.parseInt(request.getParameter("j_mdps")));
			
			int res = stmt.executeUpdate();
			
			if(res>=0) {
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				request.setAttribute("succes", "Votre compte a été créé avec succes. Vous pouvez desormais naviguer sur notre plateforme.");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				request.setAttribute("pagne", "Une erreur est survenue lors de la création de votre compte. Cliquer sur ");
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
