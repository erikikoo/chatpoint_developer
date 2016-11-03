module ClientsHelper

	def current_client
		@cached_client = @cache_client || Client.find_by(id: session[:client_id])
	end
	def logged_in?
		current_client != nil
	end
end
