Products = new Meteor.Collection("products")

if Meteor.is_client
  Template.kibo.products = -> Products.find()

  Template.kibo.events =
    'submit #new': (event) ->
      event.preventDefault()
      Products.insert($("form#new").serializeObject())
      $("form#new").resetForm()

    'input #url': (event) ->
      $.get "http://api.embed.ly/1/oembed?url=#{$("#url").val()}&key=863524f0b7494438a5387d15fff7b842", (data) ->
        $("#name").val(data.title)
        $("#description").val(data.title)
      .error ->
        alert "URL not valid."

if Meteor.is_server
  # Products.remove({})
  Products.find()
