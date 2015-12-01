define [
    'jquery'
    'underscore'
    'backbone'
    'templates',

    'models/user'
], ($, _, Backbone, JST, UserModel) ->
    class SessionView extends Backbone.View
        template: JST['app/scripts/templates/session.hbs']
        header: JST['app/scripts/templates/header.hbs']

#        model: UserModel
#        tagName: 'div'

#        className: 'wrapper'

#        id: ''

        events: {
            "click #login_button": "login"
        }

        login: (event)->
            params = {
                user: {
                    email: $("input#email").val(),
                    password: $("input#password").val()
                }
            }

            $.ajax({
                type: "POST",
                data: params,
                url: window.api_endpoint + 'session'
            })
            .then((response) =>
                window.console.log(response.token)
                sessionStorage.setItem('token', response.token)
                @model.set("username", response.user_name)
                ajaxInit())

        ajaxInit = () ->
            $.ajaxPrefilter((options) ->
                if (options.url.search(/^http/))
                    if (!options.beforeSend)
                        options.beforeSend = (xhr) ->
                            xhr.setRequestHeader('X-Auth-Token', sessionStorage.getItem('token'))
                    options.url = window.api_endpoint + options.url
                options.complete = (xhr, status) ->
                    if (status == 'error' || !xhr.responseText)
                        handleError();
                    else
                        data = xhr.responseText
            )

        initialize: () ->
            @model = new UserModel()
            @listenTo @model, 'change', @headerRender
            this.render()

        headerRender: () ->
            $('.header').html @header(@model.toJSON())

        render: () ->
            @$el.html @template()
            @headerRender()
