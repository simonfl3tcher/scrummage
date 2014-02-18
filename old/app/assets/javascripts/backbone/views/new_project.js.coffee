class App.Views.NewProject extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/new_project']

	initialize: ->
		@listenTo @model, "sync", @checkForOwnership
		@listenTo @model, "invalid", @renderErrors
		@listenTo @model, "error", @parseErrorResponse
		@model.fetch() unless @model.isNew() 

	events:
		"click button": "saveProject"

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	saveProject: (e) ->
		e.preventDefault()
		crud = @model.isNew()
		@model.set name: @$("#name").val()
		@model.set description: @$("#description").val()
		@model.set user_id: App.currentUser
		@model.save {},
			success: (model) -> 
				App.Vent.trigger "project:create", model, if crud then 'You have successfully created a project' else 'You have successfully updated the project'

	checkForOwnership: ->
		if App.currentUser and @model.get('user_id') is App.currentUser.id
			@render()
		else
			App.Vent.trigger "access_denied"
			
_.extend App.Views.NewProject.prototype, App.Mixins.Validateable