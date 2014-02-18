class App.Views.Empty extends Backbone.View 

	template: HandlebarsTemplates['backbone/templates/empty']

	render: ->
		@$el.html(@template())
		@

