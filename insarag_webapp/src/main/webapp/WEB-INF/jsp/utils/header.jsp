 <link href="bootstrap-4-dev\dist\css\bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="bootstrap-4-dev\dist\js\bootstrap.min.js" rel="stylesheet" id="bootstrap-js" ></script>
<link href="css\header.css" rel="stylesheet" id="header-css"> 
<%@ page session="true" %>

<header>

<nav class="navbar navbar-expand-lg navbar-light bg-light2 rounded">
  <a class="navbar-brand police25" href="#">
  <img class="rounded" src="http://placehold.it/400x300" width="30" height="30" alt="">
  INSARAG
 </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link color1" href="#">Accueil <span class="sr-only">(current)</span></a>
      </li>
	  <li class="nav-item color1 dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Chat
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Mail</a>
		  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Contact</a>


      </li>
      <li class="nav-item color1">
        <a class="nav-link" href="#">Mission</a>
      </li>
      <li class="nav-item">
        <a class="nav-link color1" href="#">Organisation</a>
      </li>
	        <li class="nav-item">
        <a class="nav-link color1" href="#">Carte</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
		<a class="nav-link" href="#">
		<img class="rounded" src="http://placehold.it/400x300" width="30" height="30" alt="">
  Profile:  <% session.getAttribute("name"); %></a>
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <ul class="navbar-nav mr-auto">
    	<li class="nav-item">
    		<a class="nav-link color2" href="/logout">Déconnexion</a>
    	</li>
    </ul>
  </div>
</nav>

</header>