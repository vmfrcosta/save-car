setRequestGeo = (position) => {
	const lat = position.coords.latitude;
	const lng = position.coords.longitude;
	console.log(position);
	document.querySelector('#win-lat').value  = lat;
	document.querySelector('#win-lng').value  = lng;
}

tripRequestShow = () => {
	navigator.geolocation.getCurrentPosition(setRequestGeo);
}

