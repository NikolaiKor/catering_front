#/*global require*/
'use strict'
window.root_path = '127.0.0.1/api/v1'

require.config
  shim: {
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
    handlebars:
      exports: 'Handlebars'
  }
  paths:
    jquery: '../bower_components/jquery/dist/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/lodash/dist/lodash'
    bootstrap: '../bower_components/bootstrap-sass-official/assets/javascripts/bootstrap'
    handlebars: '../bower_components/handlebars/handlebars'

require [
    'backbone',
    'app'
], (Backbone, App) ->
    App.initialize()
