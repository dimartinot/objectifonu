<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="com.objectif.onu.insarag_webapp.model.Alerte" %>
        <%@ page import="com.objectif.onu.insarag_webapp.model.Infomission" %>
                <%@ page import="com.objectif.onu.insarag_webapp.model.Liensutiles" %>
        
        <%@ page import="java.util.List" %>
                <%@ page import="java.util.ArrayList" %>
        
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Objectif ONU - Ma Mission</title>

<script src="<c:url value="\js\mission\html2canvas.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
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
	List<Liensutiles> listLiens = (List<Liensutiles>)request.getAttribute("list_liens");
	if (listLiens == null) {
		listLiens = new ArrayList<Liensutiles>();
	}
%>
<div class ="container" style="width: 80vw">
<h1> Mission </h1>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item">
	    <a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Informations mission</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="add_info-tab" data-toggle="tab" href="#add_info" role="tab" aria-controls="add_info" aria-selected="false">Ajout d'informations</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="fiche_ops-tab" data-toggle="tab" href="#fiche_ops" role="tab" aria-controls="fiche_ops" aria-selected="false">Génération de fiches missions</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="lien-tab" data-toggle="tab" href="#liens_utiles" role="tab" aria-controls="liens_utiles" aria-selected="false">Liens utiles</a>
	  </li>
	  <li class="nav-item">
	  	<a class="nav-link" id="translator-tab" data-toggle="tab" href="#translator" role="tab" aria-controls="translator" aria-selected="false">Traducteur</a>
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
		<div class="tab-pane fade" id="fiche_ops" role="tabpanel" aria-labelledby="fiche_ops-tab">
	  	<div class="jumbotron jumbotron-fluid">
				<div class="container" id="toPdf">
					<h1 class="display-4">Remplissage du formulaire d'une fiche opérationelle</h1>
					<p class="lead">
						<form >
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<label for="worksite-id">E1. Worksite ID</label>
							    		<input class="form-control" id="worksite-id" aria-describedby="help1" placeholder="Worksite ID">
							    		<small id="help1" class="form-text text-muted">Le Worksite ID combiné à l'ID Victime donne une référence unique pour enregistrer et suivre les victimes.</small>
							    	</div>
							    	<div class="col-md-6">
										<label for="victime-id">V1. ID Victime</label>
							    		<input class="form-control" id="victime-id" aria-describedby="help1" placeholder="ID Victime">
							    	</div>
							    </div>
							    <div class="form-row">
										<label for="gps-dec">E2. Coordonnées GPS (Decimal)</label>
							    		<input class="form-control" id="gps-dec" aria-describedby="help2" placeholder="Coordonnées GPS" disabled>
							    		<small id="help2" class="form-text text-muted">Coordonnées GPS de la localisation de la victime.</small>
						    	</div>
						    	<div class="form-row">
										<label for="adresse">E3. Adresse</label>
							    		<input class="form-control" id="adresse" placeholder="Adresse">
						    	</div>
						    	<div class="form-row">
						    		<div class="col-md-2">
										<label for="TeamID">G0. Team ID</label>
							    		<input class="form-control" id="TeamID" placeholder="AAA">
						    		</div>
						    		<div class="col-md-2">
							    		<input class="form-control" id="TeamIDbis" placeholder="00">
						    		</div>
						    	</div>
						    	<div class="form-row">
						    		<div class="col-md-6">
										<label for="DateExtraction">V2. Date d'extraction</label>
							    		<input class="form-control" id="DateExtraction" aria-describedby="help2" placeholder="AAA" disabled>
						    		</div>
						    		<div class="col-md-6">
						    			<label for="HeureExtraction">V3. Heure d'extraction</label>
							    		<input class="form-control" id="HeureExtraction" aria-describedby="help2" placeholder="00" disabled>
						    		</div>
						    	</div>
						    	<div class="form-row">
						    		<label for="info-comp">V4. Autre information victime, <b>uniquement</b> si demandé par LEMA/UC (ex: nom, nationalité, genre, âge...)</label> 
						    		<textarea class="form-control" name="info-comp" id="info-comp" rows="3"></textarea>
						    	</div>
						    	<div class="form-row">
						    		<div class="col-md-4">
						    			<label for="NumeroEtage">V5. Numéro d'étage</label> 
						    			<input class="form-control" name="NumeroEtage" id="NumeroEtage">
						    			<small id="help3" class="form-text text-muted">Localisation de la victime</small>
						    		</div>
						    		<div class="col">
						    			<label for="info-position">V6. Positionnement dans la structure/bâtiment</label> 
						    			<input class="form-control" name="info-position" id="info-position">
						    		</div>
						    	</div>
						    	<div class="form-row">
						    		<fieldset class="form-group">
						    			<label>V7. Quantité de travail demandée pour l'extraction de la victime: </label>
						    			<div class="form-check">
							    			<input class="form-check-input" name="workToExtract" type="radio" id="assist-only">
							    			<label for="assist-only">Assistance uniquement</label>
							    		</div>
							    		<div class="form-check">
							    			<input class="form-check-input" name="workToExtract" type="radio" id="small-debris">
							    			<label for="small-debris">Retrait de légers débris</label>
							    		</div>
							    		<div class="form-check">
							    			<input class="form-check-input" name="workToExtract" type="radio" id="a8r3">
							    			<label for="a8r3">A8R3</label>
							    		</div>
							    		<div class="form-check">
							    			<input class="form-check-input" name="workToExtract" type="radio" id="a8r4">
							    			<label for="a8r4">A8R4</label>
							    		</div>
							    		<div class="form-check">
							    			<input class="form-check-input" name="workToExtract" type="radio" id="a8r5"> 
							    			<label for="a8r5">A8R5</label>
							    		</div>
							    	</fieldset>
						    	</div>
						    	<div class="form-row">
						    		<div>V8. Durée totale de l'extraction</div></br>
						    		<label for="dureeExtractionH">Heures: </label>
							    	<input class="form-control" id="dureeExtractionH" placeholder="00">
						    		<label for="dureeExtractionM">Min: </label>
							    	<input class="form-control" id="dureeExtractionM" placeholder="00">
						    	</div>
						    	<div class="form-row">
						    		<fieldset class="form-group">
						    				<label>V9. Etat de la victime: </label></br>
										        <div class="form-check">
										          <input class="form-check-input" type="radio" name="etat" id="vivante" value="vivante">
										          <label class="form-check-label" for="vivante">
										            Vivante
										          </label>
										        </div>
										        <div class="form-check">
										          <input class="form-check-input" type="radio" name="etat" id="decedee" value="decedee">
										          <label class="form-check-label" for="decedee">
										            Décédée
										          </label>
										      </div>
						    		</fieldset>
						    	</div>
						    	<div class="form-row">
						    		<fieldset class="form-group">
									      <label>V10. Blessures de la victime</label></br>
									        <div class="form-check">
									          <input class="form-check-input" type="radio" name="blessure" id="Aucune" value="Aucune">
									          <label class="form-check-label" for="Aucune">
									            Aucune
									          </label>
									        </div>
									        <div class="form-check">
									          <input class="form-check-input" type="radio" name="blessure" id="Stables" value="option2">
									          <label class="form-check-label" for="Stables">
									            Stables
									          </label>
									        </div>
									        <div class="form-check">
									          <input class="form-check-input" type="radio" name="blessure" id="Critiques" value="option3">
									          <label class="form-check-label" for="Critiques">
									            Critiques
									          </label>
									    </div>
									  </fieldset>
						    	</div>
						    	<div class="form-row">
						    		<fieldset class="form-group">
									      <label>V11. Victime remise auprès de: </label>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix1" value="choix1">
									          <label class="form-check-label" for="choix1">
									            Locaux/Famille
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix2" value="choix2">
									          <label class="form-check-label" for="choix2">
									            Ambulance
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix3" value="choix3">
									          <label class="form-check-label" for="choix3">
									            Equipe médicale
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix4" value="choix4">
									          <label class="form-check-label" for="choix4">
									            Hôpital de terrain
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix5" value="choix5">
									          <label class="form-check-label" for="choix5">
									            Hélicoptère
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix6" value="choix6">
									          <label class="form-check-label" for="choix6">
									            Hôpital
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix7" value="choix7">
									          <label class="form-check-label" for="choix7">
									            Morgue
									          </label>
									        </div>
									        <div class="form-check col">
									          <input class="form-check-input" type="radio" name="victimHost" id="choix8" value="choix8">
									          <label class="form-check-label" for="choix8">
									            Autre..
									          </label>
									        </div>
									  </fieldset>
						    	</div>
						    	<div class="form-row">
						    		<label for="info-contact">V12. Nom et information de contact de la personne ayant récupéré la victime: </label> 
						    		<textarea class="form-control" name="info-contact" id="info-contact" rows="3"></textarea>
						    	</div>
						    	<div class="form-row">
						    		<label for="other-info">V13. Autres informations: </label> 
						    		<textarea class="form-control" name="other-info" id="other-info" rows="5"></textarea>
						    	</div>
						    	<div class="form-row">
						    		<label for="info-filler">Informations remplies par: </label> 
						    		<input class="form-control" id="info-filler" value="<%
							  				Object obj = request.getSession().getAttribute("user");
											if (obj != null) {
												Users us = (Users)request.getSession().getAttribute("user");
												out.print(us.getNom()+" "+us.getPrenom());
											} else {
												out.print(" Non connecté ");
											}
											%>" disabled>
									<label for="title-filler">Grade: </label> 
						    		<input class="form-control" id="title-filler" value="Lieutenant<%
											/* if (obj != null) {
												Users us = (Users)request.getSession().getAttribute("user");
												out.print(us.getGrade().getLibelle());
											} else {
												out.print(" Non connecté ");
											} */
											%>" disabled>
						    	</div>
							</div>
						</form>
						<br>
						<button onclick="print(4)" class="btn btn-info">Envoyer !</button> 
					</p>
				</div>
			</div>
	  </div>
		<div class="tab-pane fade" id="liens_utiles" role="tabpanel" aria-labelledby="lien-tab">
			<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-4">Liens utiles</h1>
						<p class="lead">
							<form method="GET">
							<table class="table table-hover table-light">
							  <thead>
							    <tr>
							      <th scope="col">Intitulé</th>
							      <th scope="col">Contenu</th>
							      <th scope="col">Date d'ajout</th>
							    </tr>
							  </thead>
							  <tbody>
							  <% for (Liensutiles l : listLiens ) { %>
							    <tr>
							      <th scope="row"><%= l.getIntitule() %></th>
							      <% if (l.getIsLink() == 1) { %>
							      	<td><a href="<%= l.getContenu() %>"><%= l.getContenu() %></a></td>
							      <% } else {%>
							      	<td><%=l.getContenu()%></td>
							      <% } %>
							      <td><%= l.getDate() %></td>
							    </tr>
							    <% } %>
							    <tr>
							    		<th scope="row"><input class="form-control" type="text" name="intitule"></th>
							    		<td><input class="form-control" type="text" name="contenu"><input type="checkbox" class="form-check-input" name="isLink" id="isLink"><label class="form-check-label" for="isLink">lien (Y/N)</label></td>
							    		<td><button type="submit" class="btn btn-info"> Créer !</button></td>
							    </tr>
							  </tbody>
							</table>
							</form>
						</p>
					</div>
				</div>
		</div>
		<div class="tab-pane fade" id="translator" role="tabpanel" aria-labelledby="translator-tab">
			<div class="jumbotron jumbotron-fluid">
				<iframe style="margin: 5vw" width="90%" height="400" src="/mission/translator">
				
						
				</iframe>
		</div> 
	</div>
 
</div>
</body>
<script>
//Implémentation du remplissage des données GPS auto
var gps = document.getElementById("gps-dec");

function showPosition(position) {
	gps.value = position.coords.latitude + 
	  " : " + position.coords.longitude; 
	}
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
	  gps.value = "Geolocation is not supported by this browser.";
  }
  
 //Implémentation du remplissage des données de date et d'heure auto
 var currentDate = new Date();
 var date = document.getElementById("DateExtraction");
 date.value = currentDate.getDate()+"/"+(currentDate.getMonth()+1)+"/"+currentDate.getFullYear();
 
 var hour = document.getElementById("HeureExtraction");
 hour.value = currentDate.getHours() + ":" + currentDate.getMinutes();
 
 //Print to pdf
 function print(quality = 1) {
		const filename  = 'Fiche_Ops.pdf';

		html2canvas(document.querySelector('#toPdf'), 
								{scale: quality}
						 ).then(canvas => {
			var img = canvas.toDataURL('image/jpeg');
			console.log(canvas)
			let pdf = new jsPDF('p', 'mm', [canvas.height, canvas.width]);
 			pdf.addImage(img, 'jpeg',0 , 0, canvas.width, canvas.height);
 			pdf.save(filename);
		}); 
	}
 
</script>
<jsp:include page="../utils/footer.jsp" />

</html>