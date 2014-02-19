class App.Views.Tasks extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/tasks']

	initialize: ->
		@childViews = []
		@listenTo App.Vent, 'task:create', @addToCollection
		@listenTo App.Vent, 'task:destroy', @removeTask
		@listenTo @collection, 'add', @renderTask
		@listenTo @collection, 'add', @updateCounter

	events: 
		'click .btn.deleteTask': 'destroyTask'


	updateCounter: ->
		@$('span').text(@collection.length)

	addToCollection: (model) ->
		@collection.add(model)
		App.Vent.trigger "tasks:change", model, @collection.length

	removeTask: (model) ->
		@collection.remove(model)
		App.Vent.trigger "tasks:change", model, @collection.length
		
	render: ->
		@$el.html(@template({ count: @collection.length }))
		@collection.forEach @renderTask, @
		@


	renderTask: (model) ->
		v = new App.Views.Task({ model: model  })
		@childViews.push(v)
		@$(".tasks_list").append(v.render().el)
