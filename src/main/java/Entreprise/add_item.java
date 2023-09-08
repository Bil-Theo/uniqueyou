package Entreprise;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import utilitaires.Compte;
import utilitaires.outils;

/**
 * Servlet implementation class add_item
 */
@MultipartConfig
@WebServlet("/j_security_sign_item")
public class add_item extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/uniqueyou";
	private static final String user_name = "root";
	private static final String mdps =  "root";
	private static final String query =  "INSERT INTO item VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?)";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_item() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  Compte user = (Compte)  request.getSession().getAttribute("compte");
		  
			if(user==null){
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				request.setAttribute("message", "Vous devenez vous identifiz d'abord avant de faire cette opération");
				rd.forward(request, response);
			}
		  
	      Part filePart = request.getPart("j_img");

	        // Obtenez le nom du fichier téléchargé
	        String fileName = getFileName(filePart);

	        // Chemin où vous souhaitez enregistrer le fichier
	        long tms = System.currentTimeMillis();
	        String[] img = fileName.split("\\.");
	        fileName = img[0]+"_"+Long.toString(tms)+"."+img[1];
	        
	        String savePath = "C:\\Users\\TRETEC\\Desktop\\database\\" + fileName;
	        

	        //Écrivez le fichier sur le disque
	        try (InputStream fileContent = filePart.getInputStream();
	        	     FileOutputStream out = new FileOutputStream(new File(savePath))) {
	        	    int read;
	        	    byte[] buffer = new byte[1024];
	        	    while ((read = fileContent.read(buffer)) != -1) {
	        	        out.write(buffer, 0, read);
	        	    }
	        	}
	       
		
	        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user_name, mdps);
			PreparedStatement stmt  =  conn.prepareStatement(query);
			
			stmt.setString(1, request.getParameter("j_libelle"));
			stmt.setInt(2, Integer.parseInt(request.getParameter("j_prix")));
			stmt.setInt(3, Integer.parseInt(request.getParameter("j_prix_promo")));
			stmt.setInt(4, Integer.parseInt(request.getParameter("j_promo")));
			stmt.setString(5, savePath);
			stmt.setString(6, request.getParameter("j_description"));
			stmt.setInt(7, user._id);
			stmt.setInt(8, user.type);
			
			
			
			int res = stmt.executeUpdate();
			
			if(res>=0) {
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				request.setAttribute("succes", "Ajout de l'article reussi avec succes.");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				request.setAttribute("pagne", "Une erreur est survenue lors de l'ajout de votre article. Cliquer sur ");
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
	
	private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
