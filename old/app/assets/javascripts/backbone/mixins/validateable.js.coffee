App.Mixins.Validateable =
	renderErrors: (model, errors) ->
		@clearErrors()
		_.each errors, @renderError, @

	renderError: (errors, attribute) ->
		err = errors.join "; "
		@$("#" + attribute).closest("div.control-group").addClass('error')
		@$("#" + attribute).closest("div.controls").append('<span class="help-inline">' + err + '</span>')

	parseErrorResponse: (model, response) ->
		if response and response.status is 403
			App.Vent.trigger "access_denied"
		if response and response.responseText
			errors = JSON.parse response.responseText
			@renderErrors(model, errors.errors)

	clearErrors: ->
		@$('.error').removeClass('error')
		@$('span.help-inline').remove()