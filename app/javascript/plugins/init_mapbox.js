// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');


const getKey = () => {
  return document.getElementById("gkey").dataset.key.toString();
}


const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const coordinates = JSON.parse(mapElement.dataset.tripCordinates);

  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [coordinates[1], coordinates[0]],
    // center: [-74.50, 40],
    zoom: 5
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

const getGoogleApiPlaces = (address, lng, lat, elem) => {
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      targetGeo = `https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,opening_hours,place_id,rating&locationbias=point:${lat},${lng}&key=${getKey()}`;

      fetch(proxyUrl + targetGeo)
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          getDetails(data.candidates[0].place_id, elem)
          // parse the data obj and get the data that you need to fill the form values.
      });
}


const getDetails = (placeId, form) => {
  // console.log('I call Google');
  // console.log('I wait for JSON to be parse')
  // console.log('I update the forms values');
  // console.log("PLACE ID", placeId)
  var proxyUrl = 'https://cors-anywhere.herokuapp.com/',
      targetUrl = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&fields=name,icon,photo,url,formatted_address,geometry,type,website,rating,formatted_phone_number&key=${getKey()}`;

      const formRef = form.parentElement.parentElement.parentElement;


  // fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  fetch(proxyUrl + targetUrl,)
    .then(response => response.json())
    .then((data) => {
      // console.log(data.result)
      const location = data.result.name
      const name = data.result.name
      const rating = data.result.rating
      const url = data.result.website
      const types = data.result.types
      const icon = data.result.icon
      const address = data.result.formatted_address
      const longitude = data.result.geometry.location.lng
      const latitude = data.result.geometry.location.lat
      // console.log(location)

      // const inputLocation = document.querySelector('#step_location')
      // inputLocation.value = location
      // console.log(location)

      const inputLocationStep = formRef.querySelector(".step-location-input-js");
      const inputAddressStep = formRef.querySelector(".step-address-input-js");
      const inputRating = formRef.querySelector(".activity-rating-input-js");
      const inputActivityName = formRef.querySelector('.activity-name-input-js');
      const inputUrl = formRef.querySelector(".activity-url-input-js");
      const inputTypes = formRef.querySelector(".activity-types-input-js");
      const inputIcon = formRef.querySelector(".activity-icon-input-js");
      const inputAddress = formRef.querySelector(".activity-address-input-js");



      if (inputLocationStep != null) {
        inputLocationStep.value = name;
        inputAddressStep.value = address;
        console.log(inputLocationStep, inputAddressStep)
      }

      if (inputActivityName != null) {
        inputRating.value = rating;
        inputActivityName.value = name;
        inputUrl.value = url;
        inputTypes.value = types;
        inputIcon.value = icon;
        inputAddress.value = address;
        console.log(inputRating,inputActivityName,inputUrl, inputTypes, inputIcon, inputAddress)
      }

      getPhotos(data.result.photos[0].photo_reference, formRef)
    }
  );
}

const getPhotos = (photo_reference, formRef) => {
  const url_path = `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo_reference}&key=${getKey()}`;
  const inputPhoto = formRef.querySelector(".activity-photo-input-js");
  inputPhoto.value = url_path;
  console.log(inputPhoto)
}

const getValue = (e) => {

    var elem = e.srcElement || e.target;
    const inputGeocoder = elem.parentNode.querySelector('.mapboxgl-ctrl-geocoder--input');

    // console.log(elem.value);
    const address = inputGeocoder.value;

    if (address == null || address == 'undefined' || address == "") return;

    console.log(address);

    const endpoint = `geocoding/v5/mapbox.places/${address}.json`;
    const url = `https://api.mapbox.com/${endpoint}?access_token=pk.eyJ1IjoiY2RhZm9uc2VjYSIsImEiOiJjazJlam1peHkwOWZsM29wYmxmbWw4b3pnIn0.l7jR3kxUiz-pDPh6l4fI6g`;
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const lng = data.features[0].center[0];
      const lat = data.features[0].center[1];

      getGoogleApiPlaces(address, lng, lat, elem);


      const inputLongitude = document.querySelector("#trip_longitude")
      inputLongitude.value = lng

      const inputLatitude = document.querySelector("#trip_latitude")
      inputLatitude.value = lat
    });

}

const createFetchButton = (el) => {
  var button = document.createElement('a');
  button.classList.add('fetch-link');
  button.innerHTML = 'search';
  button.onclick = function(e){
    e.preventDefault();
    getValue(e);return false;
  };
  // where do we want to have the button to appear?
  // you can append it to another element just by doing something like
  // document.getElementById('foobutton').appendChild(button);
  el.appendChild(button);
};


const initGeocoderInput = (map) => {
    const els = document.querySelectorAll('.geocoder');
    els.forEach((el, index) => {
      var geocoder = new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
      });
      el.appendChild(geocoder.onAdd(map));
      createFetchButton(el);
  })

};



const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    initGeocoderInput(map);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));
  }
};

export { initMapbox };

