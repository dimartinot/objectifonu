<%@ page import="com.objectif.onu.insarag_webapp.model.Users" %>

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
<link href="css\administration\lien.css" rel="stylesheet" id="accueil-css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->


</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->

<body>
<div class="container" style="height : 81.5vh">
   
     <hr>
    <!-- Begin of rows -->
    <div class="row carousel-row">
        <div class="col-xs-8 col-xs-offset-2 slide-row">
            <div id="carousel-1" class="carousel slide slide-carousel" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-1" data-slide-to="1"></li>
                <li data-target="#carousel-1" data-slide-to="2"></li>
              </ol>
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                    <img src="http://lorempixel.com/150/150?rand=1" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=2" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=3" alt="Image">
                </div>
              </div>
            </div>
            <div class="slide-content">
                <h4>Example product</h4>
                <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
                    sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat
                </p>
            </div>
            <div class="slide-footer">
                <span class="pull-right buttons">
                    <button class="btn btn-sm btn-default"><i class="fa fa-fw fa-eye"></i> Show</button>
                    <button class="btn btn-sm btn-primary"><i class="fa fa-fw fa-shopping-cart"></i> Buy</button>
                </span>
            </div>
        </div>
    </div>
    <div class="row carousel-row">
        <div class="col-xs-8 col-xs-offset-2 slide-row">
            <div id="carousel-2" class="carousel slide slide-carousel" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-2" data-slide-to="1"></li>
                <li data-target="#carousel-2" data-slide-to="2"></li>
              </ol>
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                    <img src="http://lorempixel.com/150/150?rand=4" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=5" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=6" alt="Image">
                </div>
              </div>
            </div>
            <div class="slide-content">
                <h4>Long text product</h4>
                <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
                    sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                    sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
                    sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                    sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
                    sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                    sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                </p>
            </div>
            <div class="slide-footer">
                <span class="pull-right buttons">
                    <button class="btn btn-sm btn-default"><i class="fa fa-fw fa-eye"></i> Show</button>
                    <button class="btn btn-sm btn-primary"><i class="fa fa-fw fa-shopping-cart"></i> Buy</button>
                </span>
            </div>
        </div>
    </div>
    <div class="row carousel-row">
        <div class="col-xs-8 col-xs-offset-2 slide-row">
            <div id="carousel-3" class="carousel slide slide-carousel" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-3" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-3" data-slide-to="1"></li>
                <li data-target="#carousel-3" data-slide-to="2"></li>
              </ol>
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                    <img src="http://lorempixel.com/150/150?rand=7" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=8" alt="Image">
                </div>
                <div class="item">
                    <img src="http://lorempixel.com/150/150?rand=9" alt="Image">
                </div>
              </div>
            </div>
            <div class="slide-content">
                <h4>Example product</h4>
                <p>
                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
                    sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                </p>
            </div>
            <div class="slide-footer">
                <span class="pull-right buttons">
                    <button class="btn btn-sm btn-default"><i class="fa fa-fw fa-eye"></i> Show</button>
                    <button class="btn btn-sm btn-primary"><i class="fa fa-fw fa-shopping-cart"></i> Buy</button>
                </span>
            </div>
        </div>
    </div>
</div>
            
            
                      

  </body> 
   <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->

 </html>