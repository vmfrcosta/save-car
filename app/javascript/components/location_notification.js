const setGoogleMap = (lat, long) => {
	const map = document.getElementById('map')
	map.setAttribute('data-markers', JSON.stringify([{lat: lat, lng: long}]))
}

const setCarLocation = (position) => {
	if (position.coords.accuracy >= 100) {
		noCarLocation()
    } else {
		const carAddress = document.querySelector('#car-address')
		const destAddress = document.querySelector('#dest-address')
		carAddress.classList.remove('required')
		carAddress.placeholder = 'Endereço atual (opcional)'
		const lat = document.querySelector('#car-lat')
		const long = document.querySelector('#car-long')
		lat.value = position.coords.latitude
		long.value = position.coords.longitude
    }
    setGoogleMap(lat.value, long.value)
}


const noCarLocation = () => {
	alert('Não conseguimos pegar sua localização por GPS, favor colocar o endereço atual.')
}

const getCarLocation = () => {
	if (navigator.geolocation) {
		navigator.permissions.query({name:'geolocation'}).then((result) => {
		    if (result.state == 'prompt') {
		    	alert('Iremos solicitar sua localização, isso acelera o processo de solicitação. Você também tem a opção de digitar o endereço, caso prefira.')
				navigator.geolocation.getCurrentPosition(setCarLocation, noCarLocation ,{maximumAge:10000, timeout:5000, enableHighAccuracy: true})
	    	} else if (result.state == 'granted') {
	    		navigator.geolocation.getCurrentPosition(setCarLocation, noCarLocation,{maximumAge:10000, timeout:5000, enableHighAccuracy: true})
			}
    	})
	}
}

export { getCarLocation }
export { setCarLocation }
