 function initialize() {
  var myLatlng = new google.maps.LatLng(map_array[0][0], map_array[0][1]);


  var mapOptions = {
    zoom: my_zoom,
    center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

 
  google.maps.event.addListener(map, 'click', function(e) {
    
   

   

     document.getElementById('answer').value = e.latLng.lat() + ', ' + e.latLng.lng();
     placeMarker(e.latLng, map);
      $.ajax({
      url: '/quizzes',
      method: 'get',
      data: {
        lat: e.latLng.lat(),
        lng: e.latLng.lng()
      }
    });

    
    

    
  });
}

function placeMarker(position, map) {
  var marker = new google.maps.Marker({
    position: position,
    map: map
  });
  
}

$(document).on('ready', function(){
  google.maps.event.addDomListener(window, 'load', initialize);
});

   

//}


//google.maps.event.addDomListener(window, 'load', initialize);
