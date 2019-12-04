import { updateRoutes } from '../components/update_routes'

const updateUserMap = (lat, lng, hidden) => {
	if (hidden === false) {
		const map = document.querySelector('#map')
		const markers = eval(map.dataset.markers)
		markers.push({lat: parseFloat(lat), lng: parseFloat(lng)})
		const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}, { "lat": markers[2]['lat'], "lng": markers[2]['lng']}];
		map.dataset.markers = JSON.stringify(positions);
	} else {
		const map = document.querySelector('#map')
		const markers = eval(map.dataset.markers)
		markers[0]['lat'] = parseFloat(lat)
    	markers[0]['lng'] = parseFloat(lng)
		const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}];
		map.dataset.markers = JSON.stringify(positions);
	}
  // updateRoutes()
}

window.updateUserMap = updateUserMap;

export { updateUserMap }
