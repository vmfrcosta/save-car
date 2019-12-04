import GMaps from 'gmaps/gmaps.js';

const updateRoutes = () => {

  const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
      map.drawRoute({
        origin: [markers[0].lat, markers[0].lng],
        destination: [markers[1].lat, markers[1].lng],
        travelMode: 'driving',
        strokeColor: '#131540',
        strokeOpacity: 0.6,
        strokeWeight: 6
      });
      map.drawRoute({
        origin: [markers[2].lat, markers[2].lng],
        destination: [markers[0].lat, markers[0].lng],
        travelMode: 'driving',
        strokeColor: '#3C43CC',
        strokeOpacity: 0.8,
        strokeWeight: 8
      });      
    }
  }
};

export { updateRoutes }
