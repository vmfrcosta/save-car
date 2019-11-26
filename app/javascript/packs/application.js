import "bootstrap";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();

// In your Javascript (external .js resource or <script> tag)
$(document).ready(function() {
    $('.js-example-basic-single').select2();
});

