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
<script type="text/javascript" src="<c:url value= '\js\FileSaver.js'/>" ></script>

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
		.list-group-item {
			margin-bottom: 10px;
		}
  </style>
  <% 
	List<Pois> list = (List<Pois>)request.getAttribute("list_pois");
%>
  <div class="container">
  	<div class="row" style="margin-top:25px;margin-bottom:25px;">
  		<div class="col">
		  <div class="card" style="width:500px; margin: 0 auto;">
		  	<div class="card-body">
				<div id="map" style="height: 500px; background: grey; border-top: 1px solid #5c8a8a; border-right: 1px solid #5c8a8a; border-bottom: 1px solid #5c8a8a;" class="news_bottom_right"></div>
		  		<div>
		  			<ul>
		  				<li><b>Départ : </b><div id="departCoordinates"></div></li>
		  				<li><b>Arrivée : </b><div id="arriveeCoordinates"></div></li>
		  			</ul>
		  		</div>
		  	</div>
		  	<div class="card-body">
		  		<strong> Options</strong>
		  		<ul class="list-group list-group-horizontal">
		  			<li class="list-group-item"><button class="btn btn-primary btn-lg btn-block" id="addmarker" onclick="buttonAddMarker()" >Ajouter point d'interet</button></li>
 					<li class="list-group-item"><button class="btn btn-success btn-lg btn-block" id="launchParcours" onclick="lancerParcours()" disabled>Lancer parcours !</button></li>
					<li class="list-group-item"><button class="btn btn-info btn-lg btn-block" id="adddepart" onclick="resetD_A()">Ré-initialiser les points de départ/arrivée</button></li>
		  		</ul>
		  	</div>
		  </div>
		</div>
		<div class="col">
			<div style="overflow-y:scroll;height:800px;" class="list-group" id="list_of_pois">
				<% for (Pois p : list) { %>
					<a class="list-group-item list-group-item-action" onclick="centerToCoordinates(<%= p.getLat() %>,<%= p.getLongi()%>)">
					<strong><%= p.getInfo()%></strong></br>lat:<%= p.getLat() %> | lon:<%= p.getLongi()%>
					<button class="btn_d btn btn-success btn-block" onclick="setDepart(<%= p.getLat() %>,<%= p.getLongi()%>)">Point de départ</button>
					<button class="btn_a btn btn-danger btn-block" onclick="setArrivee(<%= p.getLat() %>,<%= p.getLongi()%>)">Point d'arrivée</button>
					</a>
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
				li.innerHTML = "<strong>"+infos+"</strong></br>lat: "+coord.lat.toFixed(4)+" lon:"+coord.lng.toFixed(4)+"<a role='button' class='btn btn-info' style='float:right' href='/map/save?lat="+coord.lat.toFixed(4)+"&lon="+coord.lng.toFixed(4)+"&info="+infos+"'>Ajout</a>";
				li.innerHTML += 
					"<button class='btn_d btn btn-success btn-block' onclick='setDepart("+coord.lat.toFixed(4)+","+coord.lng.toFixed(4)+")'>Point de départ</button>"+
					"<button class='btn_a btn btn-danger btn-block' onclick='setArrivee("+coord.lat.toFixed(4)+","+coord.lng.toFixed(4)+")'>Point d'arrivée</button>"
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
var depart ="";
var arrivee ="";
var depart_set = false;
var arrivee_set = false;
function setDepart(lat,lon) {
	depart = lat+","+lon;
	list = document.getElementsByClassName("btn_d");
	Array.prototype.forEach.call(list, function(el) {
	    el.disabled = true
	});
	document.getElementById("departCoordinates").innerHTML = lat+", "+lon;
	depart_set = true;
	if (depart_set && arrivee_set) {
		document.getElementById("launchParcours").disabled = false;
	}
} 

function setArrivee(lat,lon) {
	arrivee = lat+","+lon;
	list = document.getElementsByClassName("btn_a");
	document.getElementById("arriveeCoordinates").innerHTML = lat+", "+lon;
	Array.prototype.forEach.call(list, function(el) {
	    el.disabled = true
	});
	arrivee_set = true;
	if (depart_set && arrivee_set) {
		document.getElementById("launchParcours").disabled = false;
	}
}

function resetD_A() {
	document.getElementById("arriveeCoordinates").innerHTML = "";
	document.getElementById("departCoordinates").innerHTML ="";
	list = document.getElementsByClassName("btn_a");
	Array.prototype.forEach.call(list, function(el) {
	    el.disabled = false
	});
	list = document.getElementsByClassName("btn_d");
	Array.prototype.forEach.call(list, function(el) {
	    el.disabled = false
	});
	depart_set = false;
	arrivee_set = false;
}

//Define a callback function to process the routing response:
var onResult = function(result) {
  var route,
    routeShape,
    startPoint,
    endPoint,
    linestring;
  if(result.response.route) {
  // Pick the first route from the response:
  route = result.response.route[0];
  // Pick the route's shape:
  routeShape = route.shape;

  // Create a linestring to use as a point source for the route line
  linestring = new H.geo.LineString();

  // Push all the points in the shape into the linestring:
  routeShape.forEach(function(point) {
    var parts = point.split(',');
    linestring.pushLatLngAlt(parts[0], parts[1]);
  });

  // Retrieve the mapped positions of the requested waypoints:
  startPoint = route.waypoint[0].mappedPosition;
  endPoint = route.waypoint[1].mappedPosition;

  // Create a polyline to display the route:
  var routeLine = new H.map.Polyline(linestring, {
    style: { strokeColor: 'blue', lineWidth: 10 }
  });

  // Create a marker for the start point:
  var startMarker = new H.map.Marker({
    lat: startPoint.latitude,
    lng: startPoint.longitude
  });

  // Create a marker for the end point:
  var endMarker = new H.map.Marker({
    lat: endPoint.latitude,
    lng: endPoint.longitude
  });

  // Add the route polyline and the two markers to the map:
  map.addObjects([routeLine, startMarker, endMarker]);

  // Set the map's viewport to make the whole route visible:
  map.setViewBounds(routeLine.getBounds());
  }
};

function lancerParcours() {
	document.getElementById("launchParcours").disabled = true;
	var routingParameters = {
			  // The routing mode:
			  'mode': 'fastest;car',
			  // The start point of the route:
			  'waypoint0': "geo!" + depart,
			  // The end point of the route:
			  'waypoint1': "geo!" + arrivee,
			  // To retrieve the shape of the route we choose the route
			  // representation mode 'display'
			  'representation': 'display'
			};
	// Get an instance of the routing service:
	var router = platform.getRoutingService();
	
	var parameterBis = { // The routing mode:
		  'mode': 'fastest;car',
		  // The start point of the route:
		  'waypoint0': depart,
		  // The end point of the route:
		  'waypoint1': arrivee,
		  // To retrieve the shape of the route we choose the route
		  // representation mode 'display'
		  'departure' : 'now'
		};

	// Call calculateRoute() with the routing parameters,
	// the callback and an error callback function (called if a
	// communication error occurs):
	router.calculateRoute(routingParameters, onResult,
	  function(error) {
	    alert(error.message);
	  });
	
	  router.calculateRoute(parameterBis,
		function (result) {
		  var tmp = document.createElement("div");
		  tmp.innerHTML = "Départ: "+depart;
		  tmp.innerHTML += "\nArrivée: "+arrivee;
		  result.response.route[0].leg[0].maneuver.forEach(function(point) {
			  tmp.innerHTML += "\n"+point.instruction;
		  });
		  str = tmp.textContent;
		  var blob = new Blob([str],{type: "text/plain;charset=utf-8"});
		  saveAs(blob,"instructions.txt");
		  console.log(str);
			//console.log(result.response.route[0].leg[0].maneuver);//a.response.route[0].leg[0].maneuver
		}, function (error) {
			alert(error);
	});
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