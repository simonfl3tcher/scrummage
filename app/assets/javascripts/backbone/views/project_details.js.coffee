class App.Views.ProjectDetails extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/project_details']

	initialize: ->
		@childViews = []
		@model.fetch() unless not @model.isNew()

	events:
		'click .btn.btn-danger': 'destroyProject'
		'click .btn.btn-primary': 'editProject'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	destroyProject: ->
		return unless confirm("Are you sure?")
		@model.destroy { wait: true }
		App.Vent.trigger "project:destroy", 'You have successfully deleted the project'

	editProject: ->
		App.Vent.trigger "project:edit", @model