 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.objectif.onu.insarag_webapp.model.Alerte" %>
  <%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
 
 <!DOCTYPE html>
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
<link href="<c:url value="\css\alert\last_alert\last_alert.css" />" rel="stylesheet" id="last-alert-editor">

</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<body>
<%
				Alerte obj = (Alerte)request.getSession().getAttribute("alerte");
				%></h1>
	<div class="container">
		<div class="jumbotron" id="main_jumb">
			<div class="container contact-form">
	            <div class="contact-image">
	                <img src="<c:url value="\img\alerte\alert.png"/>" alt="ringbell" id="top_img"/>
	            </div>
	                <h3>Alerte en cours : <%= obj.getEntete() %></h3>
	                <hr>
	               <div class="row">
	                    <div class="col-md-6">
	                        <b>Du :</b> <%= obj.getDateDebut().toString() %>
	                    </div>
	                    <div class="col-md-6">
	                        <b>Au :</b> <%= obj.getDateFin().toString() %>
	                    </div>
	                </div>
	               
	                <div class="row">
	                	<div class="col">
		                	<b>Informations supplémentaires :</b>
		                	<div class="textbox">
		                	  <%= obj.getInfosSupp().toString() %>
		                	</div>
		                </div>
	               </div>
	               <div class="row">
		               <div class="col">
		              
		               	<h5>Participants :</h5>
		               	<table class="table table-hover">
		               		<thead>
		               			<tr>
		               				<th scope="col">
		               					Nom & Prénom
		               				</th>
		               				<th scope="col">
		               					Grade
		               				</th>
		               				<th scope="col">
		               					Est Présent
		               				</th>
		               			</tr>
		               		</thead>
		               		<tbody>
		               		 <% for (Users u : obj.getUserses()) { %>
			               		<tr>
			               			<td><%= u.getNom() %> - <%= u.getPrenom() %></td>
			               			<td>Lieutenant</td>
			               			<td>
			               				<input type="radio" aria-label="est présent" checked disabled />
			               			</td>
			               		</tr>
			               		<% } %>
			              	</tbody>
		               	</table>
		              </div>
	               </div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../utils/footer.jsp" />
</html>