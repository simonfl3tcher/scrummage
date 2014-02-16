class App.Views.Content extends Backbone.View

	className: "row"
	template: HandlebarsTemplates['backbone/templates/content']

	initialize: ->
		@listenTo App.Vent, "user:logged_in", @login
		@listenTo App.Vent, "user:logged_out", @logout
		@listenTo App.Vent, "page_not_found", @pageNotFound
		@listenTo App.Vent, "already_logged_in", @alreadyLoggedIn

	render: ->
		@$el.html(@template())
		@

	swapMainToEmpty: ->
		console.log "in here"
		Backbone.history.navigate("/", true)

	swapMain: (view) ->
		@changeCurrentMainView(view)
		@$('#main-area').html(@currentMainView.render().el)

	changeCurrentMainView: (view) ->
		@currentMainView.remove() if @currentMainView
		@currentMainView = view

	swapSide: (view) ->
		@changeCurrentSideView(view)
		@$('#sidebar').html(@currentSideView.render().el)

	login: ->
		console.log "123213213431242312e"

	logout: ->
		Backbone.history.navigate("/login", true)

	pageNotFound: ->
		@alert('Page not found', 'error')

	alreadyLoggedIn: -> 
		@alert('You are already logged in', 'error')

	alert: (msg, type) ->
		alert = new App.Views.Alert({ message: msg, type: type })
		$("#header .alert").remove()
		$("#header").append(alert.render().el)

	changeCurrentSideView: (view) ->
		@currentSideView.leave() if @currentSideView
		@currentSideView = view