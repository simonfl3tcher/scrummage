class App.Views.Project extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/project']

	initialize: ->
		@listenTo @model, "destroy", @remove
		@listenTo App.Vent, "project:create", @render
		@listenTo App.Vent, "project:update", @render

	events:
		'click a': 'showDetails'


	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	showDetails: (e) ->
		e.preventDefault()

		@addActive(e)
		App.Vent.trigger 'project:show', @model
		Backbone.history.navigate '/projects/' + @model.id

	addActive: (e) ->
		$('#projectList a').removeClass('active')
		$(e.currentTarget).addClass('active')