class App.Views.NewProject extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/new_project']

	initialize: ->
		@model.fetch() unless @model.isNew() 

	events: 
		'submit': 'saveProject'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	saveProject: (e) ->
		e.preventDefault();
		crud = @model.isNew()
		@model.set name: @$("#name").val()
		@model.set description: @$("#description").val()
		@model.set project_type: 'Bespoke Application'
		@model.set created_by: App.currentUser.get('id')
		@model.set user_id: App.currentUser.get('id')
		@model.save {},
			success: (model) ->
				App.Vent.trigger 'project:create', model, if crud then 'You have successfully created a project' else 'You have successfully updated the project'