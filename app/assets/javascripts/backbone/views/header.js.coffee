class App.Views.Header extends Backbone.View

	className: "navbar navbar-default"
	template: HandlebarsTemplates['backbone/templates/header']

	render: ->
		@$el.html(@template({ current_user: App.currentUser.get('loggedIn') }))
		@

