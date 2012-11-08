# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  ($ '#new_item').fileupload
    done: (e, data) ->
      result = ($ data.result)
      url = result.find('a').attr('href').slice(0,-10)

      window.location = "#{url}/edit"

    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]

      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("upload_template", file))
        $('#images').append(data.context)
        data.submit()

      else
        alert("#{file.name} is not a gif, jpeg, or png image file")

    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar')
          .css('width', "#{progress}%")
          .text("#{progress}% (processing, please wait…)")

