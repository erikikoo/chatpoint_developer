class AdminController < ApplicationController
	layout 'admin'
	
	before_action :logado?

	def new
		@admin = Admin.new
	end

	private

	def logado?
		if session[:admin_id]
			true
		else
			false
		end
	end
end
