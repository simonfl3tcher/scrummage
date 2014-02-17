class App.Views.Empty extends Backbone.View 

	className: "well well-large"

	render: ->
		@$el.html('<h4>Please choose from the left hand panel</h4>')
		@