class App.Models.CurrentUser extends Backbone.Model

	initialize: ->
		@listenTo App.Vent, "user:logged_in", @login
		@listenTo App.Vent, "user:logged_out", @logout

	login: (id, username) -> 
		@set id: id, username: username, loggedIn: true

	logout: ->
		m = new App.Models.Login({ id: @id })
		m.destroy
			success: (model, response) =>
				@set loggedIn: false
				delete @id
				delete @attributes.username
				delete @attributes.email
				delete @attributes.email_address
				delete @attributes.id
				if response.csrfToken
					window.csrf(response.csrfToken);
