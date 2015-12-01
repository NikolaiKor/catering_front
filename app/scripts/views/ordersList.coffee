define [
    'jquery'
    'underscore'
    'backbone'
    'templates',
    'models/order',
    'collections/orders'
], ($, _, Backbone, JST, OrderModel, OrdersCollection) ->
    class OrdersListView extends Backbone.View
        el: $('.wrapper')
        templateList: JST['app/scripts/templates/ordersList.hbs']
        templateSelect: JST['app/scripts/templates/ordersListSelect.hbs']
#    tagName: 'div'

#    id: ''

#    className: 'container'

        events: {
            "change select#sprint": "sprintView"
        }

        sprintView: () ->
            @setOrder(+$("select#sprint").val())

        setOrder: (position) ->
            @model = @collection.get(position)
            @model.fetch()
            .then(() =>
                @renderOrder())

        initialize: () ->
            @collection = new OrdersCollection()
            @collection.fetch()
            .then(() =>
                @setOrder(@collection.length - 1))
            .then(() =>
                @render()
                @renderOrder())

        renderOrder: () ->
            $('#order_list').html @templateList(@model.toJSON())

        render: () ->
            $('.wrapper').html @templateSelect({"model":@model.toJSON(), "collection": @collection.toJSON()})
