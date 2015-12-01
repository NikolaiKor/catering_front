define [
    'handlebars'
], (Handlebars) ->
    Handlebars.registerHelper('dish', (dish_id) ->
        dishes = []
        dish_id.forEach((id) ->
            dishes[dishes.length] = window.dishesCollection.get(id))
    )

    Handlebars.registerHelper('quantity', (quantity) ->
        copyQuantity = +quantity
        if (copyQuantity > 1)
            "<i>(" + copyQuantity + ")</i>"
    )
