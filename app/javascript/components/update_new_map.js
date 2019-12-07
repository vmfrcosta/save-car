import { updateRoutes } from '../components/update_routes'

const updateNewMap = (newLat, newLng) => {
	const map = document.querySelector('#map')
	
	const markers = [{lat: parseFloat(eval(map.dataset.markers)[0]['lat']), lng: parseFloat(eval(map.dataset.markers)[0]['lng'])}]
	// const lat = parseFloat(markers[1]['lat'])
	// const lng = parseFloat(markers[1]['lng'])
	markers.push({lat: newLat, lng: newLng})
	console.log(markers)
	map.dataset.markers = JSON.stringify(markers)
	updateRoutes()
}

export { updateNewMap }
