class App.Views.NewProject extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/new_project']

	initialize: ->
		@model.fetch() unless @model.isNew() 

	render: ->
		@$el.html(@template(@model.toJSON()))
		@