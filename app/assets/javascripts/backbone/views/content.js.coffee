class App.Views.Content extends Backbone.View

	className: "row"
	template: HandlebarsTemplates['backbone/templates/content']

	initialize: ->
		@listenTo App.Vent, "user:logged_in", @loggedIn
		@listenTo App.Vent, "user:logged_out", @logout
		@listenTo App.Vent, "project:show", @projectShow
		@listenTo App.Vent, "page_not_found", @pageNotFound
		@listenTo App.Vent, "already_logged_in", @alreadyLoggedIn

	render: ->
		@$el.html(@template())
		@

	swapMainToEmpty: ->
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

	pageNotFound: ->
		@alert('The page you are looking for does not exist', 'warning')

	loggedIn: ->
		Backbone.history.navigate("/", true)

	logout: ->
		Backbone.history.navigate("login", true)

	alreadyLoggedIn: -> 
		@alert('You are already logged in', 'warning')

	changeCurrentSideView: (view) ->
		@currentSideView.leave() if @currentSideView
		@currentSideView = view

	alert: (msg, type) ->
		v = new App.Views.Alert({ message: msg, type: type })
		$('#alert').html(v.render().el)

	projectShow: (model) ->
		@swapMain(new App.Views.ProjectDetails({ model: model }))