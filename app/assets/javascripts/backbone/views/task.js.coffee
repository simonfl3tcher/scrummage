<<<<<<< HEAD
class App.Views.Task extends Backbone.View


	template: HandlebarsTemplates['backbone/templates/task']

	initialize: ->
		@listenTo @model, 'destroy', @remove

	events: 
		'click .btn.deleteTask': 'destroyTask'
		'click .btn.editTask': 'editTask'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	editTask: ->
		App.Vent.trigger "task:edit", @model

	remove: (model) ->
		App.Vent.trigger 'task:destroy', model, 'You have successfully deleted a task'

	destroyTask: (e) ->
		return unless confirm("Are you sure?")
		@model.destroy { wait: true }
		@$(e.currentTarget).closest('.list-group-item').parent().remove()
				
=======
class App.Views.Task extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/task']

	render: -> 
		@$el.html('<h2>Tasks</h2>')
		@
>>>>>>> fe39fe3fd7fbd9bb52b764ff284b0eeae60ee979
