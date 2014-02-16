class App.Views.Header extends Backbone.View
	# @ sign standas for this in coffee
	className: "navbar",
	template: HandlebarsTemplates['backbone/templates/header']

	initialize: ->
		@listenTo App.currentUser, "change:loggedIn", @render

	render: ->
		@$el.html(@template({ current_user: App.currentUser.get('loggedIn') }))
		@