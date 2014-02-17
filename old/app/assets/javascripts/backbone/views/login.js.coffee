class App.Views.Login extends Backbone.View

	template: HandlebarsTemplates['backbone/templates/login']

	events: 
		'click .btn': "login"

	initialize: ->
		@listenTo @model, "error", @renderError
		@listenTo @model, "sync", @triggerLoggedIn

	renderError: ->
		@$('.alert').html("Credentials are not valid").show()

	triggerLoggedIn: ->
		console.log @model

	render: ->
		@$el.html(@template())
		@

	login: (e) ->
		e.preventDefault()
		@model.set email_address: @$("#email_address").val()
		@model.set password: @$("#password").val()
		@model.save()