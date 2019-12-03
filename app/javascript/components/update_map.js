import { updateRoutes } from '../components/update_routes'

const updateMap = (position) => {
  const map = document.querySelector('#map')
  const markers = eval(map.dataset.markers)
  // console.log(markers)
  // console.log(position.coords.latitude)
  const lat = position.coords.latitude
  const lng = position.coords.longitude
  // console.log(lat)
  if (markers.length === 2) {
    markers.push({lat: lat, lng: lng})
    // console.log({lat: lat, lng: lng})
    const string = `[{${markers[0]['lat']}, ${markers[0]['lng']}}, {${markers[1]['lat']}, ${markers[1]['lng']}}, {${markers[2]['lat']}, ${markers[2]['lng']}}]`
    map.dataset.markers = string
    // console.log(string)
  } else {
    markers[2] = ({lat: lat, lng: lng})
    const string = `[{${markers[0]['lat']}, ${markers[0]['lng']}}, {${markers[1]['lat']}, ${markers[1]['lng']}}]`
    map.dataset.markers = string
    // console.log(string)
  }
  updateRoutes()
}

window.updateMap = updateMap;

export { updateMap }
