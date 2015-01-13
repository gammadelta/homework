class Users::InvitationsController < Devise::InvitationsController
 #before_action :authenticate_user!

   def update
    
      super

  end

  def edit
  end
  
  def new
  end

  private 

  def user_params
      params.require(:user).permit!
  end

=begin
    def password
  	byebug
  	if params[:user][:password] ==  params[:user][:password_confirmation] && User.find_by(invitation_token: params[:user][:invitation_token])
  		byebug
  		User.find_by(invitation_token: params[:user][:invitation_token]).password == params[:user][:password]
  		return true
  	end
  	return false
  end
=end
end