const setGoogleMap = (lat, long) => {
	const map = document.getElementById('map')
	map.setAttribute('data-markers', JSON.stringify([{lat: lat, lng: long}]))
}

const setCarLocation = (position) => {
	if (position.coords.accuracy >= 100) {
		noCarLocation()
    } else {
		const address = document.querySelector('#address')
		address.classList.remove('required')
		address.placeholder = 'Endereço (opcional)'
		const lat = document.querySelector('#lat')
		const long = document.querySelector('#long')
		lat.value = position.coords.latitude
		long.value = position.coords.longitude
    }
    setGoogleMap(lat.value, long.value)
}


const noCarLocation = () => {
	alert('Não conseguimos pegar sua localização por GPS, favor colocar o endereço.')
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
	




	// const locationBtn = document.querySelector('#get-location')
	// navigator.permissions.query({name:'geolocation'}).then((result) => {
 //    if (result.state == 'granted') {
 //      	console.log('granted');
 //    } else if (result.state == 'prompt') {
 //      	console.log('prompt');
	// 	if (confirm('Vou pedir a localização')) {
	// 			console.log('droga')
	// 		}

	// 	}
	// })
 //    } else if (result.state == 'denied') {
 //    	console.log('bloked')
 //    }
 //    })

	// 		} else {

	// 		}

export { getCarLocation }
export { setCarLocation }
