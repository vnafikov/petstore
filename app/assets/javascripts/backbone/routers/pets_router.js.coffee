class Petstore.Routers.PetsRouter extends Backbone.Router
  initialize: (options) ->
    @pets = new Petstore.Collections.PetsCollection()
    @pets.reset options.pets

  routes:
    "index"    : "index"
    ":id"      : "show"
    ".*"        : "index"

  index: ->
    @view = new Petstore.Views.Pets.IndexView(collection: @pets)
    $("#pets").html(@view.render().el)

  show: (id) ->
    pet = @pets.get(id)

    @view = new Petstore.Views.Pets.ShowView(model: pet)
    $("#pets").html(@view.render().el)
