class App.Views.Alert extends Backbone.View

	className: '"col-md-12"'

	template: HandlebarsTemplates['backbone/templates/alert']

	initialize: (options) ->
		@options = options

	render: ->
		@$el.html(@template(@options))
		@