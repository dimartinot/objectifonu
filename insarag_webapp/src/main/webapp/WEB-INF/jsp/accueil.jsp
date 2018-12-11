<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<link href="<c:url value="\css\accueil.css" />" rel="stylesheet" id="accueil-css">
<!------ Include the above in your HEAD tag ---------->

</head>

<!-- Header -->
<jsp:include page="utils/header.jsp" />
<!-- Header -->

 <body>
	<div class="container">

      <h1 class="my-4 text-center text-lg-left">Bienvenue Profil1,</h1>

      <div class="row text-center text-lg-left">

        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\mission.png" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\profil.png" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\message.png" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="/chat/mail" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\mail.png" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\carte.png" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid border border-dark rounded-circle" src="img\accueil\organisation.png" alt="">
          </a>
        </div>


          </a>
        </div>
      </div>

    </div>

 </body>
 <!-- Footer -->
<jsp:include page="utils/footer.jsp" />

<!-- Footer -->
</html>