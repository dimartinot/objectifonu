
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.0/mapsjs-ui.css?dp-version=1542186754" />
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-core.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-service.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-ui.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-mapevents.js"></script>



<link  href="<c:url value="\css\map\map.css" />" rel="stylesheet" id="map-css">

  </head>
  

<!-- Header -->
<jsp:include page="../utils/header.jsp" />
<!-- Header -->

  <body>
  <div>
  <div id="map" style="width: 50%; height: 400px; background: grey" />
  <div>
  padding
  </div>
  
  </div>

  <script  type="text/javascript" charset="UTF-8" >
  /**
   * Moves the map to display over Berlin
   *
   * @param  {H.Map} map      A HERE Map instance within the application
   */
  function moveMapToBerlin(map){
    map.setCenter({lat:52.5159, lng:13.3777});
    map.setZoom(14);
  }





  /**
   * Boilerplate map initialization code starts below:
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

  // Now use the map as required...
  moveMapToBerlin(map);
  </script>
  </body>
  
 <!-- Footer -->
<jsp:include page="../utils/footer.jsp" />

<!-- Footer -->
 
</html>