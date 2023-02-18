
class Users::AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def show
	@user = User.find(current_user.id)
	@user = current_user
  end

 

end
