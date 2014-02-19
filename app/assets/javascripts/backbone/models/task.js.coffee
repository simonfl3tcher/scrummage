class App.Models.Task extends Backbone.Model
	urlRoot:'/tasks'

class App.Collections.Tasks extends Backbone.Collection
	model: App.Models.Task
	url: '/tasks'