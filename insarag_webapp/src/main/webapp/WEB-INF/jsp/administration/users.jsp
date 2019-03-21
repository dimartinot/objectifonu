<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Grade" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Roles" %>
<%@ page import="java.util.Set" %>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Profil - INSARAG</title>


<link href="css\bootstrap\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="\js\bootstrap.min.js" rel="stylesheet" id="bootstrap-js" ></script>
<link href="<c:url value="css\utils\header.css" />" rel="stylesheet" id="header-css">
<link href="<c:url value="css\utils\footer.css" />" rel="stylesheet" id="footer-css">
<link href="
	<c:url value="css\accueil.css" />
" rel="stylesheet" id="accueil-css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->

 <body>
 	<% Users obj = (Users)(request.getSession().getAttribute("user"));
 	boolean visual = false;
 	Set<Roles> sr = (Set<Roles>)obj.getRoleses();
 	for (Roles r : sr) {
 		if (r.getTitre().equals("SUPER-ADMIN")) { 
 			visual = true; } }%>
 	<% if (visual) { %>
 	<div class ="col-md-4 offset-md-4" >
		<form action="formuser" method="POST" >
		<input  type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Créer Utilisateur"/>
		</form>
		</div>
	<% } %>
	<div class="container">
		<br>
		<br>
				<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nom</th>
      <th scope="col">Prénom</th>
      <th scope="col">Grade</th>
      <th scope="col">Poste</th>
      <th scope="col"></th>
      <% if (visual) { %>
      <th scope="col"></th>
      <% } %>
      

    </tr>
  </thead>
  <tbody>
  	<% List<Users> lu = (List<Users>) request.getAttribute("list_of_users");
  	%>

  	<% for(Users u : lu) { 
  			
  			if (obj.getIdusers() != u.getIdusers()) {%>
  	
  	
    <tr>
      <th scope="row"><%= u.getIdusers() %></th>
      <td> <%= u.getNom() %> </td>
      <td><%= u.getPrenom() %></td>
      <td><%= u.getGrade().getLibelle()  %></td>
      <td><%= u.getPostes().getLibelle()  %></td>
      <td><form action="consulprofil" method="POST" >
  	<input style = "display: none" name="id" value = <%= u.getIdusers() %> >
  	<input style = "display: none" name="nom" value = <%= u.getNom() %> >
  	<input style = "display: none" name="prenom" value = <%= u.getPrenom() %> >
  	<input style = "display: none" name="tel" value = <%= u.getTelephone() %> >
  	<input style = "display: none" name="email" value = <%= u.getEmail() %> >
  	<input style = "display: none" name="grade" value = <%= u.getGrade().getLibelle() %> >
  	<input style = "display: none" name="poste" value = <%= u.getPostes().getLibelle() %> >
  	<input style = "display: none" name="enmission" value = <%= u.getEnMission() %> >
  	<input style = "display: none" name="roles" value = <%= u.getRoleses() %> >
  	<input type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Consulter"/>
  	</form> </td>
  	<% if (visual) { %>
  		<td><form action="/promute" method="POST" >
  		<input style = "display: none" name="id-prom" value = <%= u.getIdusers() %> >
  		<input type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Promouvoir"/>
  		</form>
  		<div style="height: 5px"></div>
  		<form action= "/supprimer" method="POST" >
  		<input style = "display: none" name="id-supp"  value = <%= u.getIdusers() %> >
  		<input type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Supprimer"/>
  		</form> </td>
  		<% } %> 
  	
    </tr>
    
    
    <% }} %>
    
  </tbody>
</table>
			
			
    </div>
 </body>
 <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->
</html>