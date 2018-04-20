Petstore.Views.Pets ||= {}

class Petstore.Views.Pets.PetView extends Backbone.View
  template: HandlebarsTemplates['pets/pet']

  tagName: 'tr'

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
