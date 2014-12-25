 function initialize() {
  var myLatlng = new google.maps.LatLng(map_array[0][0], map_array[0][1]);


  var mapOptions = {
    zoom: my_zoom,
    center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

 
    for (var i = 0; i < map_array.length; i++){ 
      var location = new google.maps.LatLng(map_array[i][0], map_array[i][1]);
    
       
  
   

    }

   

}


google.maps.event.addDomListener(window, 'load', initialize);
