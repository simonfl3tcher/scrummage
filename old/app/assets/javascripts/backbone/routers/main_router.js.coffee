class App.Routers.MainRouter extends Backbone.Router
	
	routes: 
		"": "index"
		"projects": "project"
		"projects/new": "newProject"
		"projects/:id": "showProject"
		"projects/edit/:id": "editProject"
		"login": "login"
		"logout": "logout"


	initialize: ->
		@headerView = new App.Views.Header()
		@contentView = new App.Views.Content()

	index: ->
		@layoutViews()
		@contentView.swapMain(new App.Views.Ads())
		@contentView.swapSide(new App.Views.News())

	project: ->
		@layoutViews()
		@contentView.swapMain(new App.Views.Empty())
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

	newProject: ->
		@layoutViews
		if App.currentUser.get('loggedIn')
			v = @contentView.swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
		else
			v = new App.Views.AccessDenied()
			
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

	showProject: (id) ->
		@layoutViews
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
		m = new App.Models.Project({ id: id })
		@contentView.swapMain(new App.Views.ProjectDetails({ model: m }))

	editProject: (id) ->
		@layoutViews
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
		m = new App.Models.Project({ id: id })
		@contentView.swapMain(new App.Views.NewProject({ model: m }))

	login: ->
		@layoutViews()
		@contentView.swapMain( new App.Views.Login({ model: new App.Models.Login() }))

	logout: ->
		App.Vent.trigger 'user:logged_out'

	layoutViews: -> 
		$('#header').html(@headerView.render().el)
		$('#content').html(@contentView.render().el)