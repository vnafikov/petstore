Petstore.Views.Pets ||= {}

class Petstore.Views.Pets.ShowView extends Backbone.View
  template: HandlebarsTemplates['pets/show']

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
