class UserController < ApplicationController

	def show 
		  #@assignment = Assignment.find(:all, :conditions => {UID: current_user.id})
	end

	def edit
	      user = User.find(current_user.id)
	      user.userName = generateName
	      user.save!
	      redirect_to :back
	end

	
end