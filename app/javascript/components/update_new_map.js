import { updateRoutes } from '../components/update_routes'

const updateNewMap = (newLat, newLng) => {
	const map = document.querySelector('#map')
	const markers = eval(map.dataset.markers)
	console.log(markers)
	const lat = parseFloat(markers[0]['lat'])
	const lng = parseFloat(markers[0]['lng'])
	console.log(lat)
	console.log(lng)
	markers.push({lat: lat, lng: lng})
	map.dataset.markers = JSON.stringify(markers)
	// updateRoutes()
}

export { updateNewMap }
