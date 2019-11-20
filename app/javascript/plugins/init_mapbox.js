// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

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

  fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${address}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key='GOOGLE_API_KEY`)
  .then(response => response.json())
  .then((data) => {
    data.Search.forEach((result) => {
      const movie = `<li class="list-inline-item">
        <img src="${result.Poster}" alt="">
        <p>${result.Title}</p>
      </li>`;
      results.insertAdjacentHTML("beforeend", movie);
    });
  });


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

