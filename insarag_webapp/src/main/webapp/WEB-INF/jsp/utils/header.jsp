<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.InetAddress" %>


<link href="<c:url value="\css\bootstrap\bootstrap.min.css" />" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="<c:url value="\js\bootstrap.min.js" />" rel="stylesheet" id="bootstrap-js" ></script>
<link href="<c:url value="\css\utils\header.css" />" rel="stylesheet" id="header-css">

<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>

<header>

<nav class="navbar navbar-expand-lg navbar-light bg-light2 rounded">
  <a class="navbar-brand police25" href="#">
  <img class="rounded" src="http://placehold.it/400x300" width="30" height="30" alt="">
  INSARAG
 </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  
 <!--  Menu deroulant lors du mode téléphone --> 
  <div class="navbar-collapse collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link color1" href="/">Accueil <span class="sr-only">(current)</span></a>
      </li>
	  <li class="nav-item color1 dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Chat
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/chat/mail">Mail</a>
		  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Contact</a>

		</div>
      </li>
      <li class="nav-item color1">
        <a class="nav-link" href="/mission/">Mission</a>
      </li>
      <li class="nav-item">
        <a class="nav-link color1" href="#">Organisation</a>
      </li>
	        <li class="nav-item">
        <a class="nav-link color1" href="#">Carte</a>
      </li>
      <li class="nav-item dropdown">
      	<a class="nav-link color1 dropdown-toggle" href="#" id="alerteDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Alerte

      	(<b id="numberOfAlerts"></b>)</a>
      	
      	<div class="dropdown-menu" aria-labelledby="alerteDropdown">
      		<a class="dropdown-item" href="/alert/">Accueil</a>
      		<a class="dropdown-item" href="/alert/to_respond">Répondre (<b id = "numberOfAlertsBis"></b>)</a>
      	</div>
      </li>
            <li class="nav-item">
		      	<a class="nav-link" href="/profil">
		      			<img class="rounded" src="http://placehold.it/400x300" width="30" height="30" alt="">
		      	
		
  Profil:  <%
  				Object obj = request.getSession().getAttribute("user");
				if (obj != null) {
					Users us = (Users)request.getSession().getAttribute("user");
					out.print(us.getNom()+" "+us.getPrenom());
				} else {
					out.print(" Non connecté ");
				}
				%>
				</a>
      </li>
      <li class="nav-item">
    		<a class="nav-link color1" href="/logout">Deconnexion</a>
    	</li>
        </ul>
  </div>
</nav>
<script type="text/javascript" src="<c:url value="\js\header.js" />">
<%-- 	const userAction = async () => {
	  const response = await fetch('<%= InetAddress.getLocalHost().getHostAddress() %>');
	  const myJson = await response.json(); //extract JSON from the http response
	  console.log(myJson);
	} 
	userAction.repeat(5); --%>
</script>
</header>