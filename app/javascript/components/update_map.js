import { updateRoutes } from '../components/update_routes'

const updateMap = (position) => {
	const arrivedBtn = document.querySelector('#arrived-btn')
	if (arrivedBtn.hidden === false) {
  		const map = document.querySelector('#map')
    	const markers = eval(map.dataset.markers)
    	const lat = position.coords.latitude
    	const lng = position.coords.longitude
    	markers.push({lat: lat, lng: lng})
    	const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}, { "lat": markers[2]['lat'], "lng": markers[2]['lng']}];
    	map.dataset.markers = JSON.stringify(positions);
  	} else {
    	const map = document.querySelector('#map')
    	const markers = eval(map.dataset.markers)
    	const lat = position.coords.latitude
    	const lng = position.coords.longitude
    	markers[0]['lat'] = lat
    	markers[0]['lng'] = lng
    	const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}];
    	map.dataset.markers = JSON.stringify(positions);
  	}
  	// updateRoutes()
}

window.updateMap = updateMap;

export { updateMap }
