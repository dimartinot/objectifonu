 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Roles" %>
<%@ page import="java.util.HashSet" %>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Objectif ONU</title>


<link href="<c:url value="\css\bootstrap\bootstrap.min.css"/>" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<link href="<c:url value="\css\alert\alert.css" />" rel="stylesheet" id="alert-css">

</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<body>
 
		<div class="jumbotron main">
			<h3 class="display-5">Bienvenue sur la page d'accueil de la gestion des alertes !</h3>
			<p class="lead">
				En tant qu'administrateur, vous pouvez :
				<ul>
					<li> Consulter la dernière alerte de mission et/ou y répondre
					<li> Créer une nouvelle alerte de mission
				</ul>
			</p>
			<p class="lead">
				En tant que simple utilisateur, vous pouvez :
				<ul>
					<li> Consulter la dernière alerte de mission et/ou y répondre
				</ul>
			</p>
			<hr class="my-4">
			<% 
			boolean isAdmin = (Boolean)request.getSession().getAttribute("isAdmin");
        	if (isAdmin) {
        	%>
				<h3 class="display-5">Vous êtes connecté en tant qu'Administrateur, vous pouvez donc :</h3>
			<% } else {%>
				<h3 class="display-5">Vous n'êtes pas connecté en tant qu'Administrateur, vous pouvez donc :</h3>
			<% } %>
			<div class="row">
				<div class="col">
				  <a class="quicklink link1" href="last_alert">
	              	<span class="ql_caption">
	                	<span class="outer">
	                    	<span class="inner">
	                        	<h2>consulter</h2>
	                        </span>
	                    </span>
	                </span>
	                <span class="ql_top"></span>
	                <span class="ql_bottom"></span>
	               </a>
	             </div>
	             <div class="col"></div>
	             <% if (isAdmin) { %>
	             <div class="col">
	               <a class="quicklink link2" href="alert_editor">
		               <span class="ql_caption">
		               	<span class="outer">
		               		<span class="inner">
		                    	<h2>créer</h2>
		                    </span>
		                </span>
		              </span>
		              <span class="ql_top"></span>
		              <span class="ql_bottom"></span>
	              </a>
	        	</div>
	        	<% } %>
	        </div>
		</div>
</body>
<jsp:include page="../utils/footer.jsp" />
</html>