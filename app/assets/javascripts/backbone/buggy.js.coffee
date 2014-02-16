#= require_self
#= require_tree ./prototypes
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.App = 
  Routers: {}
  Collections: {}
  Views: {}
  Models: {}
  Vent: _.clone(Backbone.Events),
  Mixins: {}
  
  initialize: (data) ->
    new App.Routers.MainRouter;
    if not Backbone.History.started
      Backbone.history.start();

$(document).on 'page:load', ->
  Backbone.history.stop()
  App.initialize() 