define [
  'backbone',
  'views/session',
  'views/sprint',
  'views/ordersList'
], (Backbone, IndexView, SprintView, OrderListView) ->
  class MainRouter extends Backbone.Router
    routes: {
        "": "index"
        "sprints": "sprints"
        "orders": "orders"
    }

    index: ->
        new IndexView()

    sprints: ->
        new SprintView()

    orders: ->
        new OrderListView()
