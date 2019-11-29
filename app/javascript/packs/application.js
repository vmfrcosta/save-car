import "bootstrap";
import 'select2/dist/css/select2.css';
import { getCarLocation } from '../components/location_notification';
import { setCarLocation } from '../components/location_notification';
import { initSelect2 } from '../components/init_select2';
import { scrollLastMessageIntoView } from '../components/scroll';

// initSelect2();

// In your Javascript (external .js resource or <script> tag)
// $(document).ready(function() {
//     $('.js-example-basic-single').select2();
// });

scrollLastMessageIntoView();

if (document.querySelector('#trips-new')) {
	getCarLocation();
}
