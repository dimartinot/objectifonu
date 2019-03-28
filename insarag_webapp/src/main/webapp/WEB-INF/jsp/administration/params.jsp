<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="from"%>
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
          action="/saveusers" >
          
                <div class="row">
                    <div class="col-md-3">
                        <div class="profile-img">
                            <img src="http://placehold.it/400x300" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Changer Photo
                                <input type="file" class="form-control" name="file"/>
                            </div>
                        </div>
                    </div>
                 </div>
         		<div class="form-group">
            <label name="prenom" class="col-lg-3 control-label">Pr�nom :</label>
            <div class="col-lg-8">
              <input class="form-control" name="input-prenom" type="text" value="<%
						Users obj = (Users)request.getSession().getAttribute("user");
						out.print(obj.getPrenom());
						%>" />
				<input style="display: none" class="form-control" type="text" value="<%= obj.getIdusers()%>" name="input-id"/>
            </div>
          </div>
          <div class="form-group">
            <label name="nom" class="col-lg-3 control-label">Nom :</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="<%= obj.getNom()%>" name="input-nom"/>
            </div>
          </div>
          <div class="form-group">
            <label name="tel" class="col-lg-3 control-label">T�l�phone :</label>
            <div class="col-lg-8">
            <% if ( obj.getTelephone() != null) { %>
              <input class="form-control" type="text" value="<% out.print(obj.getTelephone()); %>" name="input-tel"/>
            <% } else { %>
           	<input class="form-control" type="text" value=""  name="input-tel">
              <% } %>
            </div>
          </div>
          <div class="form-group">
            <label name="email" class="col-lg-3 control-label">Email :</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="<%= obj.getEmail()%>" name="input-email"/>
            </div>
          </div>
          <div class="form-group">
            <label name="poste" class="col-lg-3 control-label">Poste:</label>
            <div class="col-lg-8">
              <div class="ui-select">
                <select id="user_time_zone" class="form-control" disabled>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label name="grade" class="col-md-3 control-label">Grade:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="1" disabled name="input-grade"/>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Sauvegarder les changements" name="sauvegarder"/>
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