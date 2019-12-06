import { updateNewMap } from '../components/update_new_map'

const setDistance = (response, status) => {
	if (status === 'OK') {
		document.querySelector('#total-distance').value = response['rows'][0]['elements'][0]['distance']['value'];
		document.querySelector('#total-price').value = response['rows'][0]['elements'][0]['distance']['value'] * 5;
		document.querySelector('#trip-info-card').hidden = false;
		document.querySelector('#search-btn').hidden = true;

		const dest = document.querySelector('#dest-address');
		const price = document.querySelector('#price');
		const distance = document.querySelector('#distance');
		const geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': dest.value}, function(results, status) {
      	if (status === 'OK') {
      		const lng = results[0]['geometry']['location'].lng();
      		const lat = results[0]['geometry']['location'].lat();
      		console.log(lat)
      		console.log(lng)
      		updateNewMap(lat, lng)
    	}
    });

		dest.hidden = true;
		document.querySelector('#duration').innerText = response['rows'][0]['elements'][0]['duration']['text'];
		price.innerText = `R$ ${((response['rows'][0]['elements'][0]['distance']['value'] * 5) / 100).toFixed(2)}`;
		distance.innerText = response['rows'][0]['elements'][0]['distance']['text'];
		price.hidden = false
		distance.hidden = false
	}
}

const confirmInfo = () => {
	const confirmBtn = document.querySelector('#trip-info-card');
	const searchBtn = document.querySelector('#search-btn');
	const dest = document.querySelector('#dest-address')
	const carLat = document.querySelector('#car-lat')
	const carLong = document.querySelector('#car-long')


	searchBtn.addEventListener('click', () => {
		event.preventDefault();
		console.log(carLat.value)
		console.log(carLong.value)
		console.log(dest.value)
		const service = new google.maps.DistanceMatrixService();
		const origin = {lat: parseFloat(carLat.value), lng: parseFloat(carLong.value)};
		console.log(origin)
		service.getDistanceMatrix({
			origins: [origin],
			destinations: [`${dest.value}`],
			travelMode: 'DRIVING',
		}, setDistance);
		// searchBtn.hidden = true;
		// confirmBtn.hidden = false;
	})

}

export { confirmInfo }
