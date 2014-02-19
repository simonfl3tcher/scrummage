class App.Views.Tasks extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/tasks']

	initialize: ->
		@childViews = []

	render: ->
		@$el.html(@template({ count: @collection.length }))
		@collection.forEach @renderTask, @
		@

	renderTask: (model) ->
		view = new App.Views.Task({ model: model })
		@$('#tasks_list').append(view.render().el)
