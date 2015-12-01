define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class OrderModel extends Backbone.Model
    urlRoot: "daily_rations/"

    initialize: (options) ->

    defaults: {}

    validate: (attrs, options) ->

    parse: (response, options) ->
      response
