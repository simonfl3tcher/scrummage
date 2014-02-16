class App.Routers.MainRouter extends Backbone.Router

	routes: 
		"": "index"
		"login": "login"
		"logout": "logout"
		"projects": "project"
		"*path"  : "notFound"


	initialize: ->
		@headerView = new App.Views.Header()
		@contentView = new App.Views.Content()

	index: ->
		@layoutViews()

	login: ->
		@layoutViews()
		@headerView.remove()
		@contentView.remove()
		@loginView = new App.Views.Login({ model: new App.Models.Login() })
		$('body').append(@loginView.render().el)

	logout: ->
		console.log "Logout"

	notFound: ->
		@layoutViews()
		App.Vent.trigger 'page_not_found'

	project: ->
		@layoutViews()

	layoutViews: ->
		$('#login-page').remove()
		$("#header").html(@headerView.render().el)
		$("#content").html(@contentView.render().el)