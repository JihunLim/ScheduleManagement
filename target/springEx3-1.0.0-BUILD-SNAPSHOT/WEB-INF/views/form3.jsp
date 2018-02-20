<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple Polylines</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>

      // This example creates a 2-pixel-wide red polyline showing the path of William
      // Kingsford Smith's first trans-Pacific flight between Oakland, CA, and
      // Brisbane, Australia.

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 37.550447, lng: 127.073096},
          mapTypeId: 'terrain'
        });
        var image = 'bootstrap2/css/home.png';
        var beachMarker = new google.maps.Marker({
          position: {lat: 37.550447, lng: 127.073096},
          map: map,
          icon: image
        });
        
        var flightPlanCoordinates = [
          {lat: 37.550447, lng: 127.073096},
          {lat: 37.596931, lng: 127.084749},
          {lat: 37.591173, lng: 127.027693},
          {lat: 37.390110, lng: 126.950584},
          {lat: 37.550447, lng: 127.073096}
        ];
        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 0.5,
          strokeWeight: 7
        });
		
        flightPath.setMap(map);
      }
    </script>

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYbGOOVUaDYp1_eIKrxnsLFgUsd5Kz8VY&callback=initMap">
    </script>
  </body>
</html>