<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="com.objectif.onu.insarag_webapp.model.Pois" %>
        
        <%@ page import="java.util.List" %>
                <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.0/mapsjs-ui.css?dp-version=1542186754" />
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-core.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-service.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-ui.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-mapevents.js"></script>
<!-- jquerry 
<script src="http://code.jquery.com/jquery.js"> </script>
-->

  </head>
  

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->

  <body>
  <style type="text/css">
		  .news_bottom_left {
		
		
		background-color :  #e6fff7;
		height : 400px;
		width : 200px;
		text-align : center;
		float : left;
		 border-left: 1px solid #5c8a8a  ;
		 border-bottom: 1px solid #5c8a8a;
		 border-top: 1px solid #5c8a8a;
		padding-left : 1.5%;
		
		}
		
		
		
		<!-- deux block collés
		bord arrondies à gauche
		-->
		.news_bottom_right {
		 
		 border-left: 1px solid #555;
		 border-bottom: 1px solid #555;
		 border-top: 1px solid #555;
		
		
		}
		
		div.aligner{
			
		}
		
		
		
		
		
		
		#ullist {
		  list-style-type: none;
		  margin: 0;
		  padding-left: 0;
			width : 180px;
		  background-color: #f1f1f1;
		  border: 1px solid #555;
		}
		
		.sub_ul .a_sub_ul {
			
		  display: block;
		  color: #000;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.sub_ul {
			
		  text-align: center;
		  border-bottom: 1px solid #555;
		}
		
		.sub_ul:last-child {
		  border-bottom: none;
		}
		.sub_ul a:hover{
		background-color : #555;	
		  color: white;
		}
		
		
		.sub_ul a:active{
		  background-color: #E8FFCD;
		color : black;
		}
  </style>
  <% 
	List<Pois> list = (List<Pois>)request.getAttribute("list_pois");
%>
  <div class="container">
  	<div class="row" style="margin-top:25px;">
  		<div class="col">
		  <div class="card" style="width:500px; margin: 0 auto;">
		  	<div class="card-body">
				<div id="map" style="height: 500px; background: grey; border-top: 1px solid #5c8a8a; border-right: 1px solid #5c8a8a; border-bottom: 1px solid #5c8a8a;" class="news_bottom_right"></div>
		  	</div>
		  	<div class="card-body">
		  		<strong> Options</strong>
		  		<ul class="list-group list-group-horizontal">
		  			<li class="list-group-item"><button class="btn btn-primary btn-lg btn-block" id="addmarker" onclick="buttonAddMarker()" >Ajouter point d'interet</button></li>
<!-- 					<li class="list-group-item"><button class="btn btn-success btn-lg btn-block" id="addarrive" onclick="buttonAddMarkerDepart()">Placer départ</button></li>
					<li class="list-group-item"><button class="btn btn-danger btn-lg btn-block" id="adddepart" onclick="buttonAddMarkerArriver()">Placer arrivé</button></li> -->
		  		</ul>
		  	</div>
		  </div>
		</div>
		<div class="col">
			<div class="list-group" id="list_of_pois">
				<% for (Pois p : list) { %>
					<a class="list-group-item list-group-item-action" onclick="centerToCoordinates(<%= p.getLat() %>,<%= p.getLongi()%>)"><strong><%= p.getInfo()%></strong></br>lat:<%= p.getLat() %> | lon:<%= p.getLongi()%></a>
				<% } %>
			</div>
		</div>
	</div>
</div>
  
<!--   <div class="aligner">
  		<div   class="news_bottom_left" id="test"> <strong> Options</strong>
				
			
			
			<ul id = "ullist">
				
			</ul>
			
		</div>

 
  </div> -->
  
  
  <script>

  /**
   * Moves the map to display over Paris
   *
   * @param  {H.Map} map      A HERE Map instance within the application
   */
  function moveMapToParis(map){
    map.setCenter({lat:48.856614, lng:2.3522219});
    map.setZoom(14);
	
  
  }
  
  
  
 
function addMarker(map) {
  // Attach an event listener to map display
  // on recupere les coordonnés et on appelle la function addMarkerToMap
  
  var isBodyClicked = false;

  map.addEventListener('tap', function (evt) {
    var coord = map.screenToGeo(evt.currentPointer.viewportX, evt.currentPointer.viewportY);

			if(isBodyClicked == false){
				var marker = new H.map.Marker({lat:coord.lat.toFixed(4), lng:coord.lng.toFixed(4)});
				//mettre un formulaire qui affiche les infos dans le  marker.setData(html); en dure
				var infos = prompt("Entrez les informations du Point d'intérêt : ", "");
				marker.setData( '<div>' + infos +'</div>' + '<div> Latitude : ' + coord.lat.toFixed(4) + ' Longitude : ' + coord.lng.toFixed(4) + '</div>' )//html recupere du formulaire au dessus.
				
				
				
				
				
				var bubble;
				marker.addEventListener('pointerdown', function (evt) {
				// event target is the marker itself, group is a parent event target
				// for all objects that it contains
				 bubble =  new H.ui.InfoBubble(evt.target.getPosition(), {
				  // read custom data
				  content: evt.target.getData()
				});
				// show info bubble
				ui.addBubble(bubble);
				}, false);
				
				marker.addEventListener('pointerup', function(evt) {
				bubble.close();
				}, false);
					
				group.addObject(marker);
				
				var div_list = document.getElementById("list_of_pois");
				
				var li = document.createElement("a");
				li.setAttribute("class","list-group-item list-group-item-action");
				li.innerHTML = "<strong>"+infos+"</strong></br>lat: "+coord.lat.toFixed(4)+" lon:"+coord.lng.toFixed(4)+"<a role='button' class='btn btn-info' style='float:right' href='/map/save?lat="+coord.lat.toFixed(4)+"&lon="+coord.lng.toFixed(4)+"&info="+infos+"'>&U0001f4be</a>";
				li.setAttribute("onclick","centerToCoordinates("+coord.lat.toFixed(4)+","+coord.lng.toFixed(4)+")");
				div_list.appendChild(li);

				}
				
				isBodyClicked = true;
				
			  } );
					
			}
			
						


  
function buttonAddMarker() {
		addMarker(map);
		

	
		
}
function affInfos() {

}


  /**
   *
   *
   *
   *
   * 
   *
   * Boilerplate map initialization code starts below:
   *
   *
   *
   *
   *
   *
   *
   *
   *
   */

  //Step 1: initialize communication with the platform
  var platform = new H.service.Platform({
    app_id: 'pn0iwhFlEiqPyewvmqrk',
    app_code: 'hGXylqNOYTlOPeKCYZHFPw',
    useHTTPS: true
  });
  var pixelRatio = window.devicePixelRatio || 1;
  var defaultLayers = platform.createDefaultLayers({
    tileSize: pixelRatio === 1 ? 256 : 512,
    ppi: pixelRatio === 1 ? undefined : 320
  });

  //Step 2: initialize a map  - not specificing a location will give a whole world view.
  var map = new H.Map(document.getElementById('map'),
    defaultLayers.normal.map, {pixelRatio: pixelRatio});

  //Step 3: make the map interactive
  // MapEvents enables the event system
  // Behavior implements default interactions for pan/zoom (also on mobile touch environments)
  var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

  // Create the default UI components
  var ui = H.ui.UI.createDefault(map, defaultLayers);
 var group = new H.map.Group();
  map.addObject(group);

  // Now use the map as required...
 
  //moveMapToParis(map);


  
<% for (Pois p : list) {%>
	var marker<%= p.getIdpois()%> = new H.map.Marker({lat:<%= p.getLat()%>, lng:<%=p.getLongi()%>});
	marker<%= p.getIdpois()%>.setData("<div><%= p.getInfo()%></div><div> Latitude : <%= p.getLat()%> Longitude : <%=p.getLongi()%></div>");
	var bubble<%= p.getIdpois()%>;
	marker<%= p.getIdpois()%>.addEventListener('pointerdown', function (evt) {
	// event target is the marker itself, group is a parent event target
	// for all objects that it contains
	 bubble<%= p.getIdpois()%> =  new H.ui.InfoBubble(evt.target.getPosition(), {
	  // read custom data
	  content: evt.target.getData()
	});
	// show info bubble
	ui.addBubble(bubble<%= p.getIdpois()%>);
	}, false);
	
	marker<%= p.getIdpois()%>.addEventListener('pointerup', function(evt) {
	bubble<%= p.getIdpois()%>.close();
	}, false);
 
	map.addObject(marker<%= p.getIdpois()%>);
<% } %>
function centerToCoordinates(lati,lon) {
	  map.setCenter({lat:lati,lng:lon});
	  map.setZoom(14);
}
 </script>
  </body>
  
 <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->
 
</html>	