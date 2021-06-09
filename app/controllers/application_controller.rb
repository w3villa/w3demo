class ApplicationController < ActionController::Base
	# layout "welcome"

	def after_sign_in_path_for(resource)
	  if resource.role == "ADMIN"
	  	new_path = "/admin"
	  else
	  	new_path = "/"
	  end
	  stored_location_for(resource) || new_path
	end

	private

		def authorize_user
			if current_user.role != "ADMIN"
				redirect_to root_path, notice: "You are not authorized to access this panel"
			end
	end
	
end
