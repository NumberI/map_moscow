var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 55.747127, lng: 37.626005},
    zoom: 15
  });

	map.addListener('click', function(e) {
    var coords = e.latLng
	console.log(JSON.stringify(coords));
    $.ajax({
        url : "/map_center",
        type : "post",
        data : { data_value: JSON.stringify(coords) }
    });

    $.ajax({
	    url: '/map_center',
	    dataType: 'json',
	    success: function(data) {
	    	console.log(data[0]);
	    	for (var i = 0; i < data.data.length; i++) {
			    var coords = data[i].other.coordinates;
			    var latLng = new google.maps.LatLng(coords[1],coords[0]);
	  		}
	    },
	    	error: function() {
	      alert('error');
	    }
  	});

    // var origin1 = {lat: 55.747127, lng: 37.626005};
		// var destinationB = {lat: coords.lat(), lng: coords.lng()};

		// var service = new google.maps.DistanceMatrixService();
		// service.getDistanceMatrix(
	  // {
	    // origins: [origin1],
	    // destinations: [destinationB],
	    // travelMode: 'WALKING',
	  // }, callback);

		// function callback(response, status) {
			// if (status == 'OK') {
		    // var origins = response.originAddresses;
		    // var destinations = response.destinationAddresses;

		    // for (var i = 0; i < origins.length; i++) {
		      // var results = response.rows[i].elements;
		      // for (var j = 0; j < results.length; j++) {
		        // var element = results[j];
		        // var distance = element.distance.text;
		        // var duration = element.duration.text;
		        // console.log(distance)
		      // }
		    // }
		  // }


				  // See Parsing the Results for
				  // the basics of a callback function.
		// }
  });



	$(document).ready(function() {
		$.ajax({
	    url: '/map_json',
	    dataType: 'json',
	    success: function(data) {
	    	for (var i = 0; i < data.data.length; i++) {
			    var coords = data.data[i].other.coordinates;
			    var latLng = new google.maps.LatLng(coords[1],coords[0]);
			    var marker = new google.maps.Marker({
			      position: latLng,
			      map: map
	    		});
	  		}
	    },
	    error: function() {
	      alert('error');
	    }
	  });
	});
}