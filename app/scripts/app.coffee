define [
    'jquery',
    'underscore',
    'backbone',
    'handlebars',

    'routes/main_router',

    'views/session'
], ($, _, Backbone, Handlebars, MainRouter, SessionView) ->
    class Application
        window.api_endpoint = 'http://127.0.0.1:3000/api/v1/'
        #      window.api_endpoint = 'http://cateringnikolai.herokuapp.com/api/v1/'

        initialize: ()->
            new SessionView(el: $('.wrapper'))

        MainController = new MainRouter
        Backbone.history.start()
    return new Application()
