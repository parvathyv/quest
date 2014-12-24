function initialize() {
  var myLatlng = new google.maps.LatLng(map_array[0][0], map_array[0][1]);


  var mapOptions = {
    zoom: my_zoom,
    center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

 
    for (var i = 0; i < map_array.length; i++){ 
      var location = new google.maps.LatLng(map_array[i][0], map_array[i][1]);
      var marker = new google.maps.Marker({
      position: location,
      map: map
      });
       
  
    var j = i + 1;
    var j = 1
    marker.setTitle(j.toString());
    createinfoWindow(marker, map_array[i][2]);

    }

    
    function createinfoWindow(marker, contentString){

    var infowindow = new google.maps.InfoWindow({
      content: contentString,
      maxWidth: 200
    });

    google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
    });
  }


}


google.maps.event.addDomListener(window, 'load', initialize);
