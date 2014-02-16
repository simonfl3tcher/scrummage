class App.Views.Alert extends Backbone.View

	className: 'span12'

	template: HandlebarsTemplates['backbone/templates/alert']

	initialize: (options) ->
		@options = options

	render: ->
		@$el.html(@template(@options))
		@