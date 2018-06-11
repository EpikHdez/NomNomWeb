# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this

root.editUserType = (id, name) ->
  swal({
    title: 'Editar Tipo Usuario',
    html: '<label>Nombre</label><input type="text" id="userTypeNewTitle" class="swal2-input" value="' + name + '">' +
          '<br>'
    showCancelButton: true,
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Guardar',
    preConfirm: () -> 
      return new Promise((resolve) -> 
        resolve({
          name: $('#userTypeNewTitle').val()
        })
      )
  }).then((result) ->
    if(result.dismiss)
      return

    values = result.value
    jsonUserType = {user_type: values}

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_user_type/' + id,
          type: 'put'
          dataType: 'json'
          data: jsonUserType
          success: (response) ->
            swal("Se ha editado el tipo de usuario.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );

root.deleteUserType = (id) ->
  swal({
    title: "¿Eliminar tipo de usuario?", 
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

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_user_type/' + id,
          type: 'delete'
          success: (response) ->
            swal("Se ha elimado el tipo de usuario.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );