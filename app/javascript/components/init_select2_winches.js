import 'select2';

const initSelect2Winches = () => {
  $('.select2').select2();
};

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



export { initSelect2Winches };

