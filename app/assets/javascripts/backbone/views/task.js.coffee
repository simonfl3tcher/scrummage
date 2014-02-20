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
		console.log @model.inspect
		return unless confirm("Are you sure?")
		@model.destroy { wait: true }
		@$(e.currentTarget).closest('.list-group-item').parent().remove()
				
