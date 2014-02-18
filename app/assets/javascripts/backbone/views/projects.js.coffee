class App.Views.Projects extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/projects']

	events: 
		'click a.btn': 'newProject'

	newProject: (e) ->
		e.preventDefault()
		App.Vent.trigger "project:new"

	initialize: ->
		@childViews = []
		@listenTo @collection, "reset", @render
		@listenTo App.Vent, "project:create", @renderNewProject
		@listenTo @collection, "add", @addToCollection
		@collection.fetch({ reset: true })

		@listenTo App.Vent, 'remove', @leave

	render: ->
		@$el.html(@template({ authenticated: App.currentUser.get('loggedIn') }))
		@collection.forEach @renderProject, @
		@

	addToCollection: (model) ->
		@collection.add model

	renderNewProject: (model) ->
		@model = model
		@renderProject(model)

	renderProject: (model) ->
		if @model
			if model.id is @model.id
				model.set('current_view', true)
		view = new App.Views.Project({ model: model })
		@childViews.push(view)
		@$('#projectList').append(view.render().el)