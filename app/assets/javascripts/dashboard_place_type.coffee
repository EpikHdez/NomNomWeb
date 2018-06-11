# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this

root.editPlaceType = (id, name) ->
  swal({
    title: 'Editar Tipo Usuario',
    html: '<label>Nombre</label><input type="text" id="placeTypeNewTitle" class="swal2-input" value="' + name + '">' +
          '<br>'
    showCancelButton: true,
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Guardar',
    preConfirm: () -> 
      return new Promise((resolve) -> 
        resolve({
          name: $('#placeTypeNewTitle').val()
        })
      )
  }).then((result) ->
    if(result.dismiss)
      return

    values = result.value
    jsonPlaceType = {place_type: values}

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_place_type/' + id,
          type: 'put'
          dataType: 'json'
          data: jsonPlaceType
          success: (response) ->
            swal("Se ha editado el tipo de lugar.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );

root.deletePlaceType = (id) ->
  swal({
    title: "¿Eliminar tipo de lugar?", 
    text: "No prodrá deshacer esta acción.", 
    type: "warning",
    showCancelButton: true,
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Eliminar'
    confirmButtonColor: '#D03B3B'
  })
  .then((result) ->
    if(result.dismiss)
      return

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_place_type/' + id,
          type: 'delete'
          success: (response) ->
            swal("Se ha elimado el tipo de lugar.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );