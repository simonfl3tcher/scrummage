class App.Views.Login extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/login']

	events: 
		'submit': "submit"

	initialize: ->
		@listenTo @model, "error", @renderError
		@listenTo @model, "sync", @triggerLoggedIn

	renderError: ->
		@$('.alert').html("Credentials are not valid").show()

	triggerLoggedIn: ->
		@.leave()
		App.Vent.trigger "user:logged_in", @model.get('id'), @model.get('username')
		Backbone.history.navigate("/", true)

	render: ->
		@$el.html(@template())
		@

	submit: (e) ->
		e.preventDefault()
		@model.set email_address: $("#email_address").val()
		@model.set password: $("#password").val()
		@model.save()