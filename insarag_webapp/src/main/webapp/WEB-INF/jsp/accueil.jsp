<!DOCTYPE html>
<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>

<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Objectif ONU</title>


<link href="css\bootstrap\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="\js\bootstrap.min.js" rel="stylesheet" id="bootstrap-js" ></script>
<link href="css\utils\header.css" rel="stylesheet" id="header-css">
<link href="css\utils\footer.css" rel="stylesheet" id="footer-css">
<link href="css\accueil.css" rel="stylesheet" id="accueil-css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

</head>

<!-- Header -->
<jsp:include page="utils/header.jsp" />
<!-- Header -->

 <body>
	<div class="container">

      <h1 class="my-4 text-center text-lg-left">Bienvenue , <%
				Users obj = (Users)request.getSession().getAttribute("user");
				out.print(obj.getNom()+" "+obj.getPrenom());
				%></h1>

      <div class="row text-center text-lg-left">

        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <button class="btn btn-info accueil rounded-circle">COM.</button>
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="/profil" class="d-block mb-4 h-100">
			<button class="btn btn-info accueil rounded-circle">PROFIL</button>
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <button class="btn btn-info accueil rounded-circle">ALERTE</button>
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
			<button class="btn btn-info accueil rounded-circle">CARTE</button>
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <button class="btn btn-info accueil rounded-circle">ORGA.</button>
          </a>
        </div>


      
      </div>
	<div class="push"></div>
    </div>

 </body>
 <!-- Footer -->
<jsp:include page="utils/footer.jsp" />

<!-- Footer -->
</html>