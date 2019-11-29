import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
};

const createInputCars = (data) => {
  let options = data.autos.map(model => `<option value="${model.model}" class="rounded-pill pl-4 border-0">${model.model}</option>`).join('')
  let input = `<div class="form-group select required car_model" id="created-form">
                <label class="select required font-weight-bolder ml-4 text-black-50" for="car_model">Model <abbr title="obrigatório">*</abbr></label>
                <select class="form-control select required rounded-pill pl-4 border-0" name="car[model]" id="car_model">
                <option value=""></option>
                ${options}
                </select>
              </div>`
  document.getElementById("form-to-change").innerHTML = input
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





const createInputWinches = (data) => {
  let options = data.guinchos.map(model => `<option value="${model.model}" class="rounded-pill pl-4 border-0">${model.model}</option>`).join('')
  let input = `<option value=""></option>
                ${options}
                </select>
              </div>`
  document.getElementById("winch_model").innerHTML  = input
  // $('#created-form').select2();
}

const callApiWinches = (data) => {
  fetch(`${window.location.origin}/guinchos?brand=${data}`)
  .then(response => response.json())
  .then((data) => {
    createInputWinches(data);
  })
}

$('#brand-select').on('select2:select', function (e) {
    var data = e.params.data.id;
    callApiWinches(data);
});



export { initSelect2 };

