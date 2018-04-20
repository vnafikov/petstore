Petstore.Views.Pets ||= {}

class Petstore.Views.Pets.IndexView extends Backbone.View
  template: HandlebarsTemplates['pets/index']

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (pet) =>
    view = new Petstore.Views.Pets.PetView({model : pet})
    @$('tbody').append(view.render().el)

  render: =>
    @$el.html(@template(pets: @collection.toJSON()))
    @addAll()

    return this
