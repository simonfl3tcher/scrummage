class App.Views.ProjectDetails extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/project_details']

	initialize: ->
		@childViews = []
		@model.fetch() unless not @model.isNew()

	render: ->
		@$el.html(@template(@model.toJSON()))
		@