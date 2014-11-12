class AssignmentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

 def show
 	logged_in_user
 	@assignment = Assignment.find(params[:id])
 	@user = User.find(@assignment.UID)

 end

 def new
 	logged_in_user
 	@assignment = Assignment.new


 end
 
  def create
  	logged_in_user
  	@assignment = Assignment.new(params[:assignment].permit!)
  	puts(@assignment.points)
  	@assignment.UID = current_user.id
  	@assignment.completed = false

  	if (@assignment.points <= current_user.points) && @assignment.save 
  		@assignment.save!
  		minusPoints
  		flash[:success] = "post successfully uploaded"
  		redirect_to root_path
  	else
  		if @assignment.points > current_user.points
  			flash[:danger] = "cannot use more points than you have"
  		end
  		render 'new'
  	end
  	
  end


include SessionsHelper
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless current_user        
        redirect_to root_path
      end
  end
  private
  
  def minusPoints
  	x = current_user.id
  	q = current_user.points - @assignment.points
  	User.find(x).update(points: q)

  end


end
