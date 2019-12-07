import { updateRoutes } from '../components/update_routes'

const updateUserMap = (lat, lng, status) => {
	const map = document.querySelector('#map')
	const markers = eval(map.dataset.markers)
	console.log(markers)
	console.log(status)
	if (status === 'on the way') {
		if (markers.length === 3) {
			markers[2]['lat'] = parseFloat(lat)
			markers[2]['lng'] = parseFloat(lng)
		} else {
			markers.push({lat: parseFloat(lat), lng: parseFloat(lng)})
		}
		// const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}];
	} else if (status === 'arrived') {
		
		console.log(markers.length)
		markers[0]['lat'] = parseFloat(lat)
		markers[0]['lng'] = parseFloat(lng)
		if (markers.length === 3) {
			markers.pop()
		}
		// console.log(markers)
		// const positions = [{"lat": markers[0]['lat'], "lng": markers[0]['lng']}, { "lat": markers[1]['lat'], "lng": markers[1]['lng']}, { "lat": markers[2]['lat'], "lng": markers[2]['lng']}];
	}
	// console.log(markers)
	// console.log(map.dataset.markers)
	// map.dataset.markers = JSON.stringify(positions);
	map.dataset.markers = JSON.stringify(markers);

	updateRoutes()
}

window.updateUserMap = updateUserMap;

export { updateUserMap }
