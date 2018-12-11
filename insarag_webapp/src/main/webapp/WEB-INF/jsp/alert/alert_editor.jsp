<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<form class="well span8">
        <div class="row">
            <div class="span3">
                <label>Entete d'alerte</label> <input class="span3" placeholder=
                "Entete d'alerte" type="text"> <label>Date de debut</label>
                <input class="span3" placeholder="Date de debut" type="text">
                <label>Date de fin</label> <input class="span3" placeholder=
                "Date de fin" type="text"> 
            </div>
    
            <div class="span5">
                <label>Informations supplementaires</label> 
                <textarea class="input-xlarge span5" id="message" name="message"
                rows="10">
    </textarea>
            </div><button class="btn btn-danger pull-right" type=
            "submit">Envoyer !</button>
        </div>
    </form>
</div>