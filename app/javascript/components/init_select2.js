import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
};

export { initSelect2 };

$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
