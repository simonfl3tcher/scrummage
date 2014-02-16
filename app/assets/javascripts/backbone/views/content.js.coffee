class App.Views.Content extends Backbone.View

	className: "row"
	template: HandlebarsTemplates['backbone/templates/content']

	initialize: ->
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
		console.log "page not found"

	alreadyLoggedIn: -> 
		@alert('You are already logged in', 'error')

	changeCurrentSideView: (view) ->
		@currentSideView.leave() if @currentSideView
		@currentSideView = view