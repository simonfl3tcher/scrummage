class App.Views.ProjectDetails extends Backbone.View 

	template: HandlebarsTemplates['backbone/templates/project_details']

	initialize: ->
		if @model.get('user_id') is App.currentUser.id
			@model.set owned: true

		@childViews = []
		@listenTo @model, "sync", @renderDetails
		@listenTo @model, "error", @triggerAccessDenied
		@listenTo @model, "destroy", @triggerProjectDestroy
		@model.fetch()

	events:
		"click button.btn-danger": "destroyProject"
		"click button.btn-primary": "editProject"

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	destroyProject: ->
		return unless confirm("Are you sure?")
		@model.destroy { wait: true }

	editProject: -> 
		App.Vent.trigger "project:edit", @model

	renderDetails: ->
		@$el.html(@template(@model.toJSON()))
		v = new App.Views.Issues({ collection: @model.issues })
		@childViews.push(v)
		@$('#issues').html(v.render().el)

		v1 = new App.Views.NewIssue({ model: new App.Models.Issue({ project_id: @model.id }) })
		@childViews.push(v1)
		@$('#new_issue').html(v1.render().el)

	triggerAccessDenied:-> App.Vent.trigger "access_denied"
	triggerProjectDestroy: -> App.Vent.trigger "project:destroy"