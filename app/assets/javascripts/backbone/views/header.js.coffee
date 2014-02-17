class App.Views.Header extends Backbone.View

	className: "navbar navbar-default"
	template: HandlebarsTemplates['backbone/templates/header']

	initialize: ->
		@listenTo App.Vent, 'user:logged_in', @render

	render: ->
		@$el.html(@template({ current_user: App.currentUser.get('loggedIn') }))
		@

