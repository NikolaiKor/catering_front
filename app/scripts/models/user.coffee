define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class UserModel extends Backbone.Model
    url: window.api_endpoint + '/',

    initialize: () ->

    defaults: {}

    validate: (attrs, options) ->

    parse: (response, options) ->
      response
