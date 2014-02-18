class App.Views.Project extends Backbone.View
	
	template: HandlebarsTemplates['backbone/templates/project']

	initialize: ->
		@listenTo @model, "destroy", @remove
		@listenTo @model, "sync", @render
		@listenTo App.Vent, "issues:change", @updateCounter

	events:
		'click a': 'showDetials'


	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	showDetials: (e) ->
		e.preventDefault()
		App.Vent.trigger 'project:show', @model
		Backbone.history.navigate "/projects/" + @model.id

	updateCounter: (model, count) ->
		if model.get('project_id') is @model.id
			@$('span.badge').text(count)



