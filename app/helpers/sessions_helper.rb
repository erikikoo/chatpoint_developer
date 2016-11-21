module SessionsHelper

	def set_cookie(user)
	    the_username = user.username.to_s
	    cookies.permanent.signed[:username] = the_username
  	end
end
