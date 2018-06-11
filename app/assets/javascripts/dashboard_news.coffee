# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this

root.editNews = (id, title, body) ->
  swal({
    title: 'Editar Noticia',
    html: '<label>Titulo</label><input type="text" id="newsNewTitle" class="swal2-input" value="' + title + '">' +
          '<label>Cuerpo</label><textarea id="newsNewBody" class="swal2-input">' + body + '</textarea>' +
          '<br>'
    showCancelButton: true,
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Guardar',
    preConfirm: () -> 
      return new Promise((resolve) -> 
        resolve({
          title: $('#newsNewTitle').val(),
          body: $('#newsNewBody').val()
        })
      )
  }).then((result) ->
    if(result.dismiss)
      return

    values = result.value
    jsonNews = {news: values}

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_news/' + id,
          type: 'put'
          dataType: 'json'
          data: jsonNews
          success: (response) ->
            swal("Se ha editado la noticia.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );

root.deleteNews = (id) ->
  swal({
    title: "¿Eliminar noticia?", 
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

    $.ajax 'https://nomnomapp.herokuapp.com/dashboard_news/' + id,
          type: 'delete'
          success: (response) ->
            swal("Se ha elimado la noticia.", "", "success").then((result) -> location.reload())
          error: (error) ->
            console.log(error)
  );