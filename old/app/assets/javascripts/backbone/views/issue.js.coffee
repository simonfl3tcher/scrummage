class App.Views.Issue extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/issue']

	render: ->
		@$el.html(@template(@model.toJSON()))
		@