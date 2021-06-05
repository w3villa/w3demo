class ApplicationController < ActionController::Base
	# layout "welcome"
	private

		def authorize_user
			if current_user.role != "ADMIN"
				redirect_to root_path, notice: "You are not authorized to access this panel"
			end
	end
	
end
