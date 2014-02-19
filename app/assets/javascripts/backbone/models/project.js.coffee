class App.Models.Project extends Backbone.Model
	urlRoot: "/projects"

	initialize: ->
		@listenTo @, 'change:issues', @convertIssues

	convertIssues: ->
     		@issues = new App.Collections.Tasks(@get('tasks'))

	validate: (attrs, options) ->
		errors = {}
		unless attrs.name
			errors.name = ["Can't be blank"]
		errors unless _.isEmpty errors

class App.Collections.Projects extends Backbone.Collection

	model: App.Models.Project
	url: "/projects"