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
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<link href="<c:url value="\css\alert\alert_editor\alert_editor.css" />" rel="stylesheet" id="alert-editor-css">

</head>

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<body>
	<div class="container">
		<div class="jumbotron" id="main_jumb">
			<div class="container contact-form">
            <div class="contact-image">
                <img src="<c:url value="\img\alerte\alert.png"/>" alt="ringbell" id="top_img"/>
            </div>
            <form method="post">
                <h3>Editeur d'alerte</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="entete" class="form-control" placeholder="Entete d'alerte" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="dateDebut" class="form-control" placeholder="Date de début" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="dateFin" class="form-control" placeholder="Date de fin" value="" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="txtMsg" class="form-control" placeholder="Informations supplémentaires.." style="width: 100%; height: 150px;"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-6">
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btnContact" value="Créer l'alerte !" />
                        </div>
                	</div>
                </div>
            </form>
</div>
		</div>
	</div>
</body>
<jsp:include page="../utils/footer.jsp" />
</html>