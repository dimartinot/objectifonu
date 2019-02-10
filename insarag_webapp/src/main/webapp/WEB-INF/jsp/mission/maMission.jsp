<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="com.objectif.onu.insarag_webapp.model.Alerte" %>
        <%@ page import="com.objectif.onu.insarag_webapp.model.Infomission" %>
        <%@ page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Objectif ONU - Ma Mission</title>


<!-- <link href="css\bootstrap\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 --><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- <script src="\js\bootstrap.min.js" rel="stylesheet" id="bootstrap-js" ></script>
 --><link href="css\utils\header.css" rel="stylesheet" id="header-css">
<link href="css\utils\footer.css" rel="stylesheet" id="footer-css">
<link href="css\accueil.css" rel="stylesheet" id="accueil-css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

</head>

</head>


<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->


<body>
<% Alerte a = (Alerte)request.getAttribute("alerte"); 
	List<Infomission> list = (List<Infomission>)request.getAttribute("list_infomission");
%>
<div class =" container">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item">
	    <a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Ma Mission :</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="add_info-tab" data-toggle="tab" href="#add_info" role="tab" aria-controls="add_info" aria-selected="false">Ajout d'informations supplémentaires :</a>
	  </li>
	</ul>
	
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
		<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1 class="display-4">Ma mission : <%=a.getEntete() %></h1>
					<p class="lead"><b>Details mission : <%= a.getInfosSupp() %> </b></br>
						<% for (Infomission i : list) { %>
							<div class="alert alert-info" role="alert">
								<%= i.getDetailMission() %>
							</div>
						<% } %>
					</p>
				</div>
			</div>
		</div>
	  <div class="tab-pane fade" id="add_info" role="tabpanel" aria-labelledby="add_info-tab">
	  	<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1 class="display-4">Ajouter des informations missions</h1>
					<p class="lead"><b>Information mission: </b></br>
						<form method="POST" action="ajout_info">
							<div class="form-group">
						    	<textarea class="form-control" name="info-textarea" id="info-textarea" rows="1"></textarea>
						    	<br>
						    	<button type="submit" class="btn btn-info">Envoyer !</button> 
							</div>
						</form>
					</p>
				</div>
			</div>
	  </div>
	</div>
</div>
</body>
<jsp:include page="../utils/footer.jsp" />

</html>