define [
  'underscore'
  'backbone'
  'models/order'
], (_, Backbone, OrderModel) ->

  class OrdersCollection extends Backbone.Collection
      url:  "sprints"
      model: OrderModel

