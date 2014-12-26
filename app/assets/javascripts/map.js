 function initialize() {
  var myLatlng = new google.maps.LatLng(map_array[0][0], map_array[0][1]);


  var mapOptions = {
    zoom: my_zoom,
    center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

 
  google.maps.event.addListener(map, 'click', function(e) {
   
   
    //document.getElementById('latlng1').value = e.latLng.lat() + ', ' + e.latLng.lng();

    
   
    
    //location_array[i] = [e.latLng.lat(),e.latLng.lng()];
    document.getElementById('answer').value = e.latLng.lat() + ', ' + e.latLng.lng();
     placeMarker(e.latLng, map);
    
  });
}

function placeMarker(position, map) {
  var marker = new google.maps.Marker({
    position: position,
    map: map
  });
  //map.panTo(position);

  //  var flightPath = new google.maps.Polyline({
  //   path: flightPlanCoordinates,
  //   geodesic: true,
  //   strokeColor: '#FF0000',
  //   strokeOpacity: 1.0,
  //   strokeWeight: 2
  // });

  // flightPath.setMap(map);

}

$(document).on('ready', function(){
  google.maps.event.addDomListener(window, 'load', initialize);
});

   

//}


//google.maps.event.addDomListener(window, 'load', initialize);
