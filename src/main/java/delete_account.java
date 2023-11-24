

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
 * Servlet implementation class delete_account
 */
@WebServlet("/delete_account")
public class delete_account extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "DELETE FROM compte WHERE _id = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_account() {
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
		int _id = 0;

		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devenez vous identifiez d'abord avant de faire cette opération");
		
		if(user == null) {
			rd.forward(request, response);
		}
		else { 
				if(request.getParameter("id_current") != null && user.type==4)  _id = Integer.parseInt((String) request.getParameter("id_current"));
				else if(request.getParameter("id_current") == null && user.type!=4) {_id = user._id;}
				else { rd.forward(request, response);}
			
			//System.out.print(date);
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				stmt.setInt(1, _id);
				
				stmt.executeUpdate();
				RequestDispatcher r = request.getRequestDispatcher("compte.jsp");
				request.setAttribute("succes", "Suppression reussie avec succes.");
				r.forward(request, response);
				
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
