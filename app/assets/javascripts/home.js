var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 55.747127, lng: 37.626005},
    zoom: 15
  });
	$.ajax({
		url: '/map_json',
		dataType: 'json',
		success: function(data) {
			for (var i = 0; i < data.data.length; i++) {
				var coords = data.data[i].other.coordinates;
				var latLng = new google.maps.LatLng(coords[0],coords[1]);
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

	
	map.addListener('click', function(e) {
		var coords = e.latLng
		console.log(JSON.stringify(coords));
		$.ajax({
			url : "/map_center",
			type : "post",
			data : { data_value: JSON.stringify(coords) }
		});
		
		var tbl_delete = document.getElementById("table1");
		if(tbl_delete) tbl_delete.parentNode.removeChild(tbl_delete);
		
		pause(500);
		
		function pause(ms){
			var date = new Date();
			var curDate = null;
			do { curDate = new Date(); }
			while(curDate-date > ms);
		};
		
		$.ajax({
			url: '/map_center',
			dataType: 'json',
			success: function(data) {
				if (data.length == 0){
					alert('Зданий поблизости не найдено');
					return false;
				};
				console.log(data);
				if (data.length == 0){alert('Зданий поблизости не найдено')};
				// var obj_keys = Object.keys(data[0]);
				
				var place = document.getElementsByClassName('table')[0];
				var tbl = document.createElement('table');
				tbl.style.width = '100%';
				tbl.setAttribute('border', '1');
				var tbdy = document.createElement('tbody');
				var obj;
				for (var i = 0; i < data.length + 1; i++) {
					if (i == 0 ){
						obj = Object.keys(data[0]);
					} else {
						obj = Object.values(data[i-1])
					};
					// var obj_values = Object.values(data[i-1]);
					var tr = document.createElement('tr');
					for (var j = 0; j < obj.length - 1; j++) {
						var td = document.createElement('td');
						td.appendChild(document.createTextNode(obj[j]))
						// i == 1 && j == 1 ? td.setAttribute('rowSpan', '2') : null;
						tr.appendChild(td);
					}
					tbdy.appendChild(tr);
				}
				tbl.appendChild(tbdy);
				place.appendChild(tbl);
				tbl.setAttribute("id", "table1");

			},
			error: function() {
				console.log('error');
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
}