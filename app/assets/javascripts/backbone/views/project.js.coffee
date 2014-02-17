class App.Views.Project extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/project']

	events:
		'click a': 'showDetails'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	showDetails: (e) ->
		e.preventDefault()
		App.Vent.trigger 'project:show', @model
		Backbone.history.navigate '/projects/' + @model.id

