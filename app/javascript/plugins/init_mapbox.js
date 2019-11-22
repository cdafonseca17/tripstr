// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');


const getKey = () => {
  return document.getElementById("gkey").dataset.key.toString();
}



const getKey = () => {
  return document.getElementById("gkey").dataset.key.toString();
}

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker( {"color": marker.color} )
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const getGoogleApiPlaces = (address, lng, lat) => {
  // console.log('I call Google');
  // console.log('I wait for JSON to be parse')
  // console.log('I update the forms values');
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      // targetUrl = `https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=`,

      // anotherTarget = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=place_id,photos,formatted_address,name,icon,rating,opening_hours,geometry&key=';
      targetGeo = `https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,opening_hours,place_id,rating&locationbias=point:${lat},${lng}&key=${getKey()}`;
  // fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  fetch(proxyUrl + targetGeo)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      getDetails(data.candidates[0].place_id)
      // parse the data obj and get the data that you need to fill the form values.
  });
}


const getDetails = (placeId) => {
  // console.log('I call Google');
  // console.log('I wait for JSON to be parse')
  // console.log('I update the forms values');
  // console.log("PLACE ID", placeId)
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      targetUrl = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&fields=name,icon,photo,url,formatted_address,geometry,type,website,rating,formatted_phone_number&key=${getKey()}`;

  // fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  fetch(proxyUrl + targetUrl,)
    .then(response => response.json())
    .then((data) => {
      // console.log(data.result)
      const location = data.result.name
      const name = data.result.name
      const rating = data.result.rating
      const url = data.result.website
      const types = data.result.types[0]
      const icon = data.result.icon
      const address = data.result.formatted_address
      const longitude = data.result.geometry.location.lng
      const latitude = data.result.geometry.location.lat
      console.log(name)

      const inputLocation = document.querySelector("#step_location")
      inputLocation.value = location

      const inputRating = document.querySelector("#activity_rating")
      inputRating.value = rating

      const inputName = document.querySelector("#name_activity_custom")
      inputName.value = name;
      console.log(document.getElementById("name_activity_custom").value)
      // alert(document.getElementById("activity_name").value);

      const inputUrl = document.querySelector("#activity_url")
      inputUrl.value = url

      const inputTypes = document.querySelector("#activity_types")
      inputTypes.value = types

      const inputIcon = document.querySelector("#activity_icon")
      inputIcon.value = icon

      const inputAddress = document.querySelector("#activity_address")
      inputAddress.value = address
      console.log(data.result)
      getPhotos(data.result.photos[0].photo_reference)
    }
  );
}

const getPhotos = (photo_reference) => {
// <<<<<<< api_key
//   console.log("PHOTO REF", photo_reference)

//   var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
//       targetUrl = `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo_reference}&key=${getKey()}`;
//   fetch(proxyUrl + targetUrl, { headers: { Authorization: authorization } })
//     .then(response => response)
//     .then((data) => {
//       // console.log(data);
//     }
//   );
//   document.getElementById("testphoto").src = proxyUrl + targetUrl
// =======
  url_path = `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo_reference}&key=${getKey()}`;
  const inputPhoto = document.querySelector("#activity_photo");
  inputPhoto.value = url_path;
}

const getValue = (e) => {
  if(e.keyCode == 13) {
    var elem = e.srcElement || e.target;
    // console.log(elem.value);
    const address = elem.value;
    // const lat = address.candidates[0].geometry.location.lat
    // console.log(address)


    const endpoint = `geocoding/v5/mapbox.places/${address}.json`;
    const url = `https://api.mapbox.com/${endpoint}?access_token=pk.eyJ1IjoiY2RhZm9uc2VjYSIsImEiOiJjazJlam1peHkwOWZsM29wYmxmbWw4b3pnIn0.l7jR3kxUiz-pDPh6l4fI6g`;
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const lng = data.features[0].center[0];
      const lat = data.features[0].center[1];
      getGoogleApiPlaces(address, lng, lat);
    });

  }
}

const initGeocoderInput = (map) => {
  const el = document.getElementById('geocoder');
  var geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
  });
  el.appendChild(geocoder.onAdd(map));

  const value = el.addEventListener('keypress', getValue);

  // geocoder.on('results', function(results) {
     // console.log(results);
  // })

};



const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    initGeocoderInput(map);
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));
  }
};

export { initMapbox };

