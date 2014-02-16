#= require_self
#= require_tree ./lib
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
    App.currentUser = new App.Models.CurrentUser(data.current_user)
    new App.Routers.MainRouter;
    Backbone.history.start();