class App.Views.Content extends Backbone.View

	className: "row"
	template: HandlebarsTemplates['backbone/templates/content']

	initialize: ->
		@listenTo App.Vent, "project:create", @redirectToEdit
		@listenTo App.Vent, "project:update", @redirectToEdit
		@listenTo App.Vent, "project:new", @swapMainToNewProject
		@listenTo App.Vent, "project:destroy", @projectDestroy
		@listenTo App.Vent, "project:edit", @editProject
		@listenTo App.Vent, "project:show", @projectShow
		@listenTo App.Vent, "task:create", @alertSuccess
		@listenTo App.Vent, "task:edit", @editTask
		@listenTo App.Vent, "task:update", @redirectToProject
		@listenTo App.Vent, "user:logged_in", @loggedIn
		@listenTo App.Vent, "user:logged_out", @logout
		@listenTo App.Vent, "page_not_found", @pageNotFound
		@listenTo App.Vent, "already_logged_in", @alreadyLoggedIn

	render: ->
		@$el.html(@template())
		@

	swapMainToEmpty: (alert = '') ->
		@alert alert, 'success'
		@swapMain(new App.Views.Empty)

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

	redirectToEdit: (model, msg) ->
		@alert msg, 'success'
		@projectShow model

	redirectToProject: (model, msg) ->

		m = new App.Models.Project({ id: model.get('project_id')})
		@swapMain(new App.Views.ProjectDetails({ model: m }))
		@alertSuccess(model, msg)
		Backbone.history.navigate("/projects/" + m.id )

	swapMainToNewProject: ->
		@swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
		Backbone.history.navigate("/projects/new")

	projectDestroy: (alert) -> 
		@alert alert, 'success'
		@swapMain(new App.Views.Empty)
		Backbone.history.navigate("/projects")

	alertSuccess: (model, msg) ->
		@alert(msg, 'success')

	alertWarning: (model, msg) ->
		alert(msg, 'warning')

	alert: (msg, type = 'success') ->
		v = new App.Views.Alert({ message: msg, type: type })
		$('#alert').html(v.render().el)

	editProject: (model) ->
		@swapMain(new App.Views.NewProject({ model: model }))
		Backbone.history.navigate('/projects/edit/' + model.id)

	editTask: (model) ->
		@swapMain(new App.Views.NewTask({ model: model }))
		Backbone.history.navigate('/projects/task/' + model.id)

	projectShow: (model) ->
		@swapMain(new App.Views.ProjectDetails({ model: model }))

		