// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

// const photo = document.getElementById('');
// const rating = document.getElementById('');
// const url = document.getElementById('');
// const icon = document.getElementById('');
// const type = document.getElementById('');
// const place_id = document.getElementById('');


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

const getGoogleApiPlaces = (address) => {
  // console.log('I call Google');
  // console.log('I wait for JSON to be parse')
  // console.log('I update the forms values');
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      targetUrl = `https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyBI4-a-0aKDJs2qaArqsW1tHjfLg893wkE`,
      anotherTarget = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=place_id,photos,formatted_address,name,icon,rating,opening_hours,geometry&key=AIzaSyBI4-a-0aKDJs2qaArqsW1tHjfLg893wkE';

  // fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  fetch(proxyUrl + anotherTarget)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      getDetails(data.candidates[0].place_id)
      // parse the data obj and get the data taht you need to fill the form values.
  });
}


const getDetails = (placeId) => {
  // console.log('I call Google');
  // console.log('I wait for JSON to be parse')
  // console.log('I update the forms values');
  console.log("PLACE ID", placeId)
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      targetUrl = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&fields=name,photo,url,type,website,rating,formatted_phone_number&key=AIzaSyBI4-a-0aKDJs2qaArqsW1tHjfLg893wkE`;

  // fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  fetch(proxyUrl + targetUrl)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    }
  );
}

const getPhotos = (photo_reference) => {
  console.log("PHOTO REF", photo_reference)
}

const getValue = (e) => {
  if(e.keyCode == 13) {
    var elem = e.srcElement || e.target;
    const address = elem.value;
    getGoogleApiPlaces(address)
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
  //    console.log(results);
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

