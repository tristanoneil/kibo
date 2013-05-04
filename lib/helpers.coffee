if Meteor.is_client
  $.fn.serializeObject = ->
    o = {}
    a = @serializeArray()

    $.each a, ->
      if o[@name] isnt `undefined`
        o[@name] = [o[@name]]  unless o[@name].push
        o[@name].push @value or ""
      else
        o[@name] = @value or ""

    o

  $.fn.resetForm = ->
    @[0].reset()
