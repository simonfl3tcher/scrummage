class App.Views.ProjectDetails extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/project_details']

	initialize: ->
		
		@childViews = []
		@listenTo @model, "sync", @renderDetails
		@model.fetch() 

	events:
		'click .btn.deleteProject': 'destroyProject'
		'click .btn.editProject': 'editProject'

	render: ->
		@$el.html(@template(@model.toJSON()))
		@

	destroyProject: ->
		return unless confirm("Are you sure?")
		@model.destroy { wait: true }
		App.Vent.trigger "project:destroy", 'You have successfully deleted the project'

	editProject: ->
		App.Vent.trigger "project:edit", @model

	renderDetails: ->
		@$el.html(@template(@model.toJSON()))
		v = new App.Views.Tasks({ collection: @model.tasks })
		@childViews.push(v)
		@$('#tasks').html(v.render().el)

		v1 = new App.Views.NewTask({ model: new App.Models.Task({ project_id: @model.id }) })
		@childViews.push(v)
		@$("#new_task").html(v1.render().el)
