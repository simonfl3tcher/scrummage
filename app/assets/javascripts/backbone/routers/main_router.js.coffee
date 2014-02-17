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
		if App.currentUser.get('loggedIn')
			App.Vent.trigger "already_logged_in"
			Backbone.history.navigate('', true)
		else
			@layoutViews()
			@contentView.swapMain( new App.Views.Login({ model: new App.Models.Login() }))

	logout: ->
		App.Vent.trigger "user:logged_out"
		Backbone.history.navigate('login', true)

	notFound: ->
		@layoutViews()
		App.Vent.trigger 'page_not_found'

	project: ->
		@layoutViews()

	layoutViews: ->
		$('#login-page').remove()
		$("#header").html(@headerView.render().el)
		$("#content").html(@contentView.render().el)