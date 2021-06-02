class Admin::ApplicationController < ApplicationController
	# layout "welcome"
	before_action :authenticate_user!
	before_action :authorize_user

	private

		def authorize_user
			if current_user.role != "ADMIN"
				redirect_to root_path, notice: "You are not authorized to access this panel"
			end
		end
end
