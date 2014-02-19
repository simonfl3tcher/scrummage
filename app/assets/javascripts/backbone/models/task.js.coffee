class App.Models.Task extends Backbone.Model
	urlRoot: "/tasks"

	validate: (attrs, options) ->
		errors = {}
		unless attrs.name
			errors.name = ["Can't be blank"]
		errors unless _.isEmpty errors

class App.Collections.Tasks extends Backbone.Collection 
	model: App.Models.Task
	url: "/tasks"

