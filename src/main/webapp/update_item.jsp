<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utilitaires.Compte"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%
	HttpSession s = request.getSession(false);
	Compte user = (Compte) s.getAttribute("compte");
	
	if(user==null){
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("message", "Vous devenez vous identifiz d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajout article</title>
    <link rel ="stylesheet" type='text/css' href='./assets/css/styles.css'>
    <link rel ="stylesheet" type='text/css' href='./assets/css/bootstrap.min.css'>
    <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
</head>
<body>
	<header>
		<nav style='margin-left: 10%; margin-right: 10%;'>
			<h1 class='titre' style='font-size: 250%; margin-left: -5%;'>Unique you</h1>
			<img src='./assets/images/systeme/logo.JPG' class='logo' alt='logo'/>
			<h3 class='theme' style='font-size: 170%; margin-left: 20%'>Modifier produit</h3>
			<h3  class='theme' style='font-size: 80%; color: black;  margin-left: 30%;'><a style='text-decoration: none; color: black' href="javascript:history.back()"><svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000040}</style><path d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z"/></svg></a></h3>
		</nav>
	</header>
	<%
		

		 String url = "jdbc:mysql://localhost:3306/uniqueyou";
		 String user_name = "root";
		 String mdps =  "root";
		 String query = "SELECT * FROM item WHERE id_user =  ? AND _id = ?";
		 
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user_name, mdps);
				PreparedStatement stmt  =  conn.prepareStatement(query);
				int i = Integer.parseInt(request.getParameter("id_current"));
				
				stmt.setInt(1, user._id);
				stmt.setInt(2, i);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()){
				
		%>
	<div class='form-block' style='margin-top: 5%;'>
			<form action="j_update_item" class='form-login' method="post" enctype="multipart/form-data">
			<input value='<%=i %>' style="display: none" name="j_id"/> 
				<div class='form-group-sign' style='margin-top: 2%'>
					<label class='label-m' style='font-weight: bold; font-size: 100%;'>Libellé du produit <span style='color: red'>*</span></label>
					<input value='<%= rs.getString("libelle") %>' name='j_libelle' type='text' class='entrer-sign' required placeholder='ex: mayonaise Bama'>
				</div>
				<div class='form-group-sign'>
					<label class='label-m' style='font-weight: bold; font-size: 100%;'>Prix du produit <span style='color: red'>*</span></label>
					<input value='<%= rs.getInt("prix") %>' name='j_prix' type='number' class='entrer-sign' required>
				</div>
				<div class='form-group-sign' style='margin-top: 10%'>
					<label class='label-m' style='font-weight: bold; font-size: 100%;'>Votre produit est-il en promotion ?</label>
					<div style='margin-left: 6%'>
						<input name='j_promo' id='oui' type='radio' class='entrer-sign' value='1'>
						<label class='label-m'>Oui</label>
						<input name='j_promo' id='non' type='radio' class='entrer-sign' value='0' checked style='margin-left: 50%;'>
						<label class='label-m'>Non</label>
					</div>
				</div>
				<div class='form-group-sign' id='promo' style='display: none;'>
				    <label class='label-m' style='font-weight: bold; font-size: 100%;'>Prix du produit en promo <span style='color: red'>*</span></label>
					<input name="j_prix_promo" value='<%= rs.getInt("prix_promo") %>'  type='number' class='entrer-sign' required>
				</div>
				<div class='form-group-sign' style=''>
					<label class='label-m' style='font-weight: bold; font-size: 100%;'>Choisir une image <span style='color: red'>*</span></label>
					<div class='entrer-sign' style='height: 50%; border: solid black 2px; border-color: #7C6F6F;'><input name='j_img' type='file' accept='image/*'  style='width: 90%'></div>
				</div>
				<div class='form-group-sign'>
					<label class='label-m' style='font-weight: bold; font-size: 100%;'>Description du produit </label>
					<textarea value='<%= rs.getString("description") %>' placeholder='Ex: Ce produit est....' style='border-radius: 4%; border: solid black 2px; border-color: #7C6F6F; background-color: #FEF9F9' type='text' class='entre-sign' name="j_description" rows="10" cols="50"></textarea>
				</div>
				<button type="submit" class="btn btn-success" style='font-size: 20px; margin-left: 40%; margin-top: 15%;  border-color: #10D4FF; background-color: #10D4FF;'>Modifier</button>
			</form>
		</div>
		<% }		
			}catch(SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 %>
	<script type="text/javascript" src='./assets/scripts/bascrypt.js'></script>
</body>
</html>