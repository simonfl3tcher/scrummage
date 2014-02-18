class App.Routers.MainRouter extends Backbone.Router

	routes: 
		"": "index"
		"login": "login"
		"logout": "logout"
		"projects": "project"
		"projects/new": "newProject"
		"projects/:id": "showProject"
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
		@contentView .leave()
		v = new App.Views.Login({ model: new App.Models.Login() })
		$('#login').html(v.render().el)

	showProject: (id) ->

		@layoutViews()
		@contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
		m = new App.Models.Project({ id: parseInt(id) })
		m.fetch
			success: (data) ->
				App.Vent.trigger "project:show", new App.Models.Project(data.attributes)