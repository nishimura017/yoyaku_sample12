class Users::ProfilesController < ApplicationController

	class Users::ProfilesController < ApplicationController
		before_action :set_user, only: [:show, :edit, :update]
	
		def show
		end
	
		def edit
		end
	
		def update
			if @user.update(user_params)
				flash[:notice] = "ユーザー情報を更新しました"
				redirect_to user_path(@user)
			else
				flash.now[:alert] = "更新に失敗しました"
				render :edit
			end
		end
	
		private
	
		def set_user
			@user = current_user
		end
	
		def user_params
			params.require(:user).permit(:username, :profile, :profile_image)
		end
	end
	
end
