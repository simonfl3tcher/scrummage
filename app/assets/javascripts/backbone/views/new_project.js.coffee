class App.Views.NewProject extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/new_project']

	initialize: ->
		@listenTo @model, "invalid", @renderErrors
		@listenTo @model, "error", @parseErrorResponse
		@listenTo @model, "change", @render
		@model.fetch() unless @model.isNew() 

	events: 
		'submit': 'saveProject'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	saveProject: (e) ->
		
		e.preventDefault();

		crud = @model.isNew()
		type = @$("#projectType").val()

		@model.set name: @$("#name").val()
		@model.set project_type: type
		@model.set description: @$("#description").val()
		@model.set created_by: App.currentUser.get('id')
		@model.set user_id: App.currentUser.get('id')

		@model.save {wait: true},
			success: (model) ->
				if crud 
					App.Vent.trigger 'project:create', model, 'You have successfully created a project' 
				else 
					App.Vent.trigger 'project:update', model,'You have successfully updated the project'


_.extend App.Views.NewProject.prototype, App.Mixins.Validateable
