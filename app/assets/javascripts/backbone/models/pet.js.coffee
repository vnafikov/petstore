class Petstore.Models.Pet extends Backbone.Model
  paramRoot: 'pet'

  defaults:
    id: null
    name: null
    photoUrls: null
    category: null
    status: null
    tags: null

class Petstore.Collections.PetsCollection extends Backbone.Collection
  model: Petstore.Models.Pet
  url: '/pets'
