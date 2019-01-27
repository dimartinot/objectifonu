<%@ page session="true" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>
<%@ page import="com.objectif.onu.insarag_webapp.model.Roles" %>
<%@ page import="java.util.HashSet" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive product landing page.">
    <title>Profil de "NAME" - Consultation</title>


<link href="css\bootstrap\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-1.10.2.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
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
            <div class="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="http://placehold.it/400x300" alt=""/>
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
		                                Grade + <%
						Users obj = (Users)request.getSession().getAttribute("user");
						out.print(obj.getNom()+" "+obj.getPrenom());
						%>
                                    </h5>
                                    <h6>
                                        Grade
                                    </h6>
                                    <%
									
										if (obj.getEnMission() == 1) { %>			
                                    <p class="proile-rating">ACTIVITE : <span>EN MISSION</span></p>
                                    <% } else { %>
                                    <p class="proile-rating">ACTIVITE : <span>DISPONIBLE</span></p>
                                    <% } %>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Infos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                    	<form action ="modifprofil" method="post">
                        <input type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                        </form>
                        <% obj = (Users)request.getSession().getAttribute("user");
				        	HashSet<Roles> s = (HashSet<Roles>)obj.getRoleses();
				        	boolean isAdmin = false;
				        	for (Roles r : s) {
				        		if (r.getTitre().toUpperCase().equals("ADMIN")) {
				        			isAdmin = true;
				        		}
				        	}
				        	if (isAdmin) {
				        %>
                        
                        <form method ="POST">
                        <input style = "display: none" value = <%= obj.getIdusers() %> >
                        <input type="submit" class="btn-info profile-edit-btn" name="btnAddMore" value="Promouvoir" id = "promute"/>
                        </form>
                       
                        <form method ="POST">
                        <input style = "display: none" value = <%= obj.getIdusers() %> >
                        <input type="button" class="btn-info profile-edit-btn" name="btnAddMore" value="Supprimer"/>
                        </form>
                        <% } %>
                    </div>
                   
                </div>

                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Prenom</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%= obj.getPrenom() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Nom</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%= obj.getNom() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%= obj.getEmail() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Téléphone</label>
                                            </div>
                                            <% if (obj.getTelephone() == null) { %>
                                            <div class="col-md-6">
                                                <p><i>Non communiqué</i></p>
                                            </div>
                                            <% } else { %>
                                            <div class="col-md-6">
                                                <p><i><%= obj.getTelephone() %></i></p>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Poste</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>À implémenter...<%-- <%= obj.getPostes() %> --%></p>
                                            </div>
                                        </div>
                            </div>
                            
                        </div>
                    </div>
                
            </div>
            </div>
                      
        
        
        </div>
        <div class="push"></div> 
  </body> 
   <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->

 </html>