import "bootstrap";
import 'select2/dist/css/select2.css';
import { getCarLocation } from '../components/location_notification';
import { setCarLocation } from '../components/location_notification';
import { initSelect2Cars } from '../components/init_select2_cars';
import { initSelect2Winches } from '../components/init_select2_winches';
import { scrollLastMessageIntoView } from '../components/scroll';
import { updateMap } from '../components/update_map'
import { updateUserMap } from '../components/update_user_map'
import { confirmInfo } from '../components/confirm_trip'

initSelect2Cars();
initSelect2Winches();

// In your Javascript (external .js resource or <script> tag)
// $(document).ready(function() {
//     $('.js-example-basic-single').select2();
// });

scrollLastMessageIntoView();

if (document.querySelector('#trips-new')) {
	getCarLocation();
}

confirmInfo()
