class App.Views.Alert extends Backbone.View
	
	tagName: "col-md-12"

	template: HandlebarsTemplates['backbone/templates/alert']

	initialize: (options) ->
		@options = options

	render: ->
		@$el.html('<h1>Error</h1>')
		@