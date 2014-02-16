class SessionsController < ApplicationController

	def create 
		@user = login(params[:email_address], params[:password])
		render status: 422 unless @user
	end

	def destroy 
		logout
		render :json => {
		    'csrfParam' => request_forgery_protection_token,
		    'csrfToken' => form_authenticity_token
		  }.to_json
	end

end