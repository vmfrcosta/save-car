import 'select2';

const initSelect2Cars = () => {
  $('.select2').select2();
};

const createInputCars = (data) => {
  let options = data.autos.map(model => `<option value="${model.model}" class="rounded-pill pl-4 border-0">${model.model}</option>`).join('')
  let input = `<option value=""></option>
                ${options}
                </select>`
  document.getElementById("car_model").innerHTML = input
  // $('#created-form').select2();
}

const callApiCars = (data) => {
  fetch(`${window.location.origin}/autos?brand=${data}`)
  .then(response => response.json())
  .then((data) => {
    createInputCars(data);
  })
}

$('#brand-select').on('select2:select', function (e) {
    var data = e.params.data.id;
    callApiCars(data);
});

export { initSelect2Cars };
