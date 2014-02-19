class App.Views.Task extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/task']

	render: -> 
		@$el.html('<h2>Tasks</h2>')
		@