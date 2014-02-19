class App.Routers.MainRouter extends Backbone.Router

	routes: 
		"": "index"
		"login": "login"
		"logout": "logout"
		"projects": "project"
		"projects/new": "newProject"
		"projects/:id": "showProject"
		"projects/edit/:id": "editProject"
		"projects/task/:id": "editTask"
		"*path"  : "notFound"


	initialize: ->
		@headerView = new App.Views.Header()
		@contentView = new App.Views.Content()

	index: ->
		@layoutViews()

	login: ->
		@loginViews()

	logout: ->
		App.Vent.trigger "user:logged_out"
		Backbone.history.navigate('login', true)

	notFound: ->
		@layoutViews()
		App.Vent.trigger 'page_not_found'

	project: ->
		@layoutViews()
		@contentView.swapMain(new App.Views.Empty())
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

	newProject: ->
		@layoutViews()
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
		@contentView.swapMain(new App.Views.NewProject({ model: new App.Models.Project }))

	layoutViews: ->
		$("#header").html(@headerView.render().el)
		$("#content").html(@contentView.render().el)

	loginViews: ->
		@headerView.leave()
		@contentView.leave()
		v = new App.Views.Login({ model: new App.Models.Login() })
		$('#login').html(v.render().el)

	editProject: (id) ->
		@layoutViews()
		model = @getModel id
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects, model: model }))
		@contentView.swapMain(new App.Views.NewProject({ model: model }))

	editTask: (id) ->
		@layoutViews()
		model = new App.Models.Task({ id: parseInt(id) })
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects, model: new App.Models.Project({id: model.get('project_id') }) }))
		console.log model
		@contentView.swapMain(new App.Views.NewTask({ model: model }))

	showProject: (id) ->
		@layoutViews()
		model = new App.Models.Project({ id: parseInt(id) })
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects, model: model }))
		@contentView.swapMain(new App.Views.ProjectDetails({ model: model }))
<<<<<<< HEAD
		# model.fetch
		# 	success: (data) ->
		# 		App.Vent.trigger "project:show", new App.Models.Project(data.attributes)
=======
		model.fetch
			success: (data) ->
				App.Vent.trigger "project:show", new App.Models.Project(data.attributes)
>>>>>>> fe39fe3fd7fbd9bb52b764ff284b0eeae60ee979

	getModel: (id) ->
		model = new App.Models.Project({ id: parseInt(id) })
		model