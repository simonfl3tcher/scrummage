class App.Views.Projects extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/projects']

	events: 
		'click a.btn': 'newProject'

	newProject: ->
		console.log "123123123"

	initialize: ->
		@childViews = []
		@listenTo @collection, "reset", @render
		@collection.fetch({ reset: true })

	render: ->
		@$el.html(@template({ authenticated: App.currentUser.get('loggedIn') }))
		@collection.forEach @renderProject, @
		@

	renderProject: (model) ->
		view = new App.Views.Project({ model: model })
		@childViews.push(view)
		@$('#projectList').append(view.render().el)