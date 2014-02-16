class App.Views.Issues extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/issues']

	initialize: ->
		@childViews = []
		@listenTo App.Vent, 'issue:create', @addToCollection
		@listenTo @collection, 'add', @renderIssue
		@listenTo @collection, 'add', @updateCounter

	addToCollection: (model) ->
		@collection.add(model)
		App.Vent.trigger "issues:change", model, @collection.length

	render: ->
		@$el.html(@template({ count: @collection.length }))
		@collection.forEach @renderIssue, @
		@

	renderIssue: (model) ->
		v = new App.Views.Issue({ model: model })
		@$('#issues_list').append(v.render().el)

	updateCounter: ->
		@$('span').text(@collection.length)