class App.Views.Content extends Backbone.View

	className: "row"

	template: HandlebarsTemplates['backbone/templates/content']

	initialize: ->
		@listenTo App.Vent, "project:create", @redirectToEdit
		@listenTo App.Vent, "project:new", @swapMainToNewProject
		@listenTo App.Vent, "project:show", @projectShow
		@listenTo App.Vent, "project:destroy", @swapMainToEmpty
		@listenTo App.Vent, "project:edit", @editProject
		@listenTo App.Vent, "user:logged_in", @swapMainToEmpty
		@listenTo App.Vent, "access_denied", @accessDenied
		@listenTo App.Vent, "user:logged_out", @logout

	accessDenied: -> 
		@swapMain(new App.Views.AccessDenied())

	projectShow: (model) ->
		@swapMain(new App.Views.ProjectDetails({ model: model }))

	editProject: (model) ->
		@swapMain(new App.Views.NewProject({ model: model }))
		Backbone.history.navigate('/projects/edit/' + model.id)

	swapMainToEmpty: (model, alert = '')->
		Backbone.history.navigate("/projects", true)

	redirectToEdit: (model) ->
		Backbone.history.navigate("/projects/" + model.id, true)

	swapMainToNewProject: ->
		@swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
		Backbone.history.navigate("/projects/new")

	render: ->
		@$el.html(@template())
		@

	swapMain: (view) ->
		@changeCurrentMainView(view)
		@$('#main-area').html(@currentMainView.render().el)

	changeCurrentMainView: (view) ->
		@currentMainView.leave() if @currentMainView
		@currentMainView = view

	swapSide: (view) ->
		@changeCurrentSideView(view)
		@$('#sidebar').html(@currentSideView.render().el)

	logout: ->
		Backbone.history.navigate("/login", true)


	changeCurrentSideView: (view) ->
		@currentSideView.leave() if @currentSideView
		@currentSideView = view