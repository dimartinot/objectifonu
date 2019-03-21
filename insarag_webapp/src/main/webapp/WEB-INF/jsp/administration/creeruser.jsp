<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Grade" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Postes" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Roles" %>
<%@ page import="java.util.HashSet" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Profil de "NAME" - Consultation</title>


<link href="css\bootstrap\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="\js\bootstrap.min.js" rel="stylesheet" id="bootstrap-js" ></script>
<link href="css\utils\header.css" rel="stylesheet" id="header-css">
<link href="css\utils\footer.css" rel="stylesheet" id="footer-css">
<link href="css\administration\profils.css" rel="stylesheet" id="accueil-css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->


</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->

<body>
<div class="page">
<div class="container emp-profile">
            <form method="POST"
          action="/creeruser" >
          
                <h2> CRÉER UTILISATEUR </h2>
                <form>
            <div class="form-group row">
			    <label name="prenom" for="inputEmail3" class="col-sm-2 col-form-label">Prénom</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="input-prenom" id="inputPrenom3">
			    </div>
		  </div> 
		  <div class="form-group row">
			    <label name="nom" for="inputEmail3" class="col-sm-2 col-form-label">Nom</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="input-nom" id="inputNom3">
			    </div>
		  </div>  
		  <div class="form-group row">
			    <label name="tel" for="inputEmail3" class="col-sm-2 col-form-label">Téléphone</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="input-tel" id="inputTelephone3">
			    </div>
		  </div>       
		  <div class="form-group row">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" name="input-email" id="inputEmail3" >
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="input-mdp" id="inputPassword3">
		    </div>
		  </div>
		  <fieldset class="form-group row">
		  	<label for="inputPostes3" class="col-sm-2 col-form-label">Poste</label>	     
		      <div class="col-sm-10">
                <select name="input-poste" class="form-control">
                <% List<Postes> lp = (List<Postes>) request.getAttribute("list_of_postes"); %>
                <% for(Postes p : lp) { %>
                  <option  value=<%= p.getIdPoste() %>> <%= p.getLibelle() %></option>
                 <% } %>
                </select>
              </div>
		      
		  </fieldset>
		  
		  <fieldset class="form-group row">
		  	<label for="inputPostes3" class="col-sm-2 col-form-label">Grade</label>	     
		      <div class="col-sm-10">
                <select name="input-grade" class="form-control" >
                <% List<Grade> lg = (List<Grade>) request.getAttribute("list_of_grades"); %>
                <% for(Grade g : lg) { %>
                  <option value =<%= g.getIdGrade() %> > <%= g.getLibelle() %></option>
                 <% } %>
                </select>
              </div>
		      
		  </fieldset>
		  
		  <fieldset class="form-group row">
		  	<label for="inputPostes3" class="col-sm-2 col-form-label">Rôle</label>	     
		      <div class="col-sm-10">
                <select name="input-role" class="form-control">
                <option value= "USER"> USER </option>
                  <option value= "ADMIN"> ADMIN </option>
                 <option value= "SUPER-ADMIN"> SUPER-ADMIN </option>
                </select>
              </div>
		      
		  </fieldset>
		  
		  <div class="form-group row">
		    <div class="col-sm-10">
		      <input type="submit" class="btn btn-primary" value="Créer Utilisateur" name="sauvegarder"/>
              <span></span>
              <input type="reset" class="btn btn-default" value="Annuler" name="annuler"/>
		    </div>
		  </div>
		  
</form>
         	
          
                      
        
        
        </div>
        <div class="push"></div> 
  </body> 
   <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->

 </html>