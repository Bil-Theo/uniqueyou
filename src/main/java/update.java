

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

/**
 * Servlet implementation class update
 */
@WebServlet("/j_security_account")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "UPDATE compte set nom = ?, email = ?, telephone = ?, mdps = ?, codePostal = ?, ville = ?, pays = ? WHERE _id = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
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
			stmt.setInt(4, Integer.parseInt(request.getParameter("j_mdps")));
			stmt.setInt(5, Integer.parseInt(request.getParameter("j_postal")));
			stmt.setString(6, request.getParameter("j_ville"));
			stmt.setString(7, request.getParameter("j_pays"));
			stmt.setInt(8, Integer.parseInt(request.getParameter("j_id")));
			
			int res = stmt.executeUpdate();
			
			if(res>=0) {
				RequestDispatcher rd = request.getRequestDispatcher("boutique.jsp");
				request.setAttribute("succes", "Vos modifications sur votre compte a été considérées.");
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
