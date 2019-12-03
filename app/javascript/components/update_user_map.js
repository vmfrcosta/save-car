import { updateRoutes } from '../components/update_routes'

const updateUserMap = (lat, lng) => {
  const map = document.querySelector('#map')
  const markers = eval(map.dataset.markers)
  console.log(markers)
  // console.log(position.coords.latitude)
  // console.log(lat)
  markers.push({lat: lat, lng: lng})
  // console.log({lat: lat, lng: lng})
  const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}, { "lat": markers[2]['lat'], "lng": markers[2]['lng']}];
  map.dataset.markers = JSON.stringify(positions);
  // console.log(stringify)
  updateRoutes()
}

window.updateUserMap = updateUserMap;

export { updateUserMap }
