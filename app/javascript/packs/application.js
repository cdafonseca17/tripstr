import "bootstrap";
// CSS
// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
// internal imports
// import { initMapbox } from '../plugins/init_mapbox';
import activatePlacesSearch from '../plugins/google_autocomplete_api';
// import initMap from '../plugins/google_map';
// searching on mapbox map

// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import smoothScroll from "../plugins/find_a_trip_auto_scroll";

import "../plugins/homepage_cardtrip_animation";

import { initUpdateNavbarOnScroll } from '../plugins/init_navbar';

initUpdateNavbarOnScroll();

activatePlacesSearch();

smoothScroll();

// initMap();


// initMapbox();
