class App.Views.NewTask extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/new_task']

	events: 
		'submit': 'saveTask'

	initialize: ->
		@listenTo @model, "invalid", @renderErrors
		@listenTo @model, "error", @parseErrorResponse
		@listenTo @model, "sync", @render
		@listenTo @model, "add", @add
		@model.fetch() 

	render: ->
		@$el.html(@template(@model.toJSON()))
		@


	saveTask: (e) ->
		
		e.preventDefault();

		crud = @model.isNew()
		type = @$("#taskType").val()

		@model.set name: @$("#name").val()
		@model.set task_type: type
		@model.set description: @$("#description").val()

		@model.save {},
			success: (model) ->
				if crud 
					App.Vent.trigger 'task:create',  model, 'You have successfully created a task' 
				else 
					App.Vent.trigger 'task:update', model, 'You have successfully updated the task'

	add: ->
		console.log "123434232"

	clearForm: ->
		@$('#name').val('')
		@$('#description').val('')
		@$('#taskType').val('')
		@clearErrors()
		delete @model.id


_.extend App.Views.NewTask.prototype, App.Mixins.Validateable
