class AssignmentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

 def show
 	logged_in_user
  @assignment = Assignment.find(params[:id])
 	@user = User.find(@assignment.UID)
  @answer = Response.new
  @answers = Response.where(assignmentID: @assignment.id)
  @done = Response.find_by(assignmentID: @assignment, UID: current_user.id)
  @message = Message.new
 	#byebug
  rescue ActiveRecord::RecordNotFound
  redirect_to root_url, :flash => { :error => "Record not found." }

 end

 def new
 	logged_in_user
 	@assignment = Assignment.new
 	@subs = Subject.all.map { |s| (["--"+s.name, 0]) }
 	index = 1
 	@subs.length.times do |x|
		 Subsubject.where(subjectID: x+1).each do |i|
			@subs.insert(index, [i.name, i.id])
			index+= 1
		end
		index+= 1
	end

 end
 
  def create
  	logged_in_user
  	@assignment = Assignment.new(params[:assignment].permit!)

  	if  @assignment.save && (@assignment.points <= current_user.points)  
  		@assignment.UID = current_user.id
  		@assignment.completed = false
  		@assignment.save!
  		minusPoints
  		flash[:success] = "post successfully uploaded"
  		redirect_to @assignment
  	else
  		if @assignment.points && @assignment.points > current_user.points
  			flash[:danger] = "cannot use more points than you have"
  		end
  		render 'new'
  	end
  	
  end
  
  def edit
  	logged_in_user
  	@assignment = Assignment.find(params[:id])
  	check_user(@assignment)
  end

  def update
  	logged_in_user
  	@assignment = Assignment.find(params[:id])
  	check_user(@assignment)
   	x = @assignment.points
   	y = current_user.points + x

  	if (@assignment.points <= x) && @assignment.update_attributes(params[:assignment].permit!) 
  		current_user.update(points: x)
  		@assignment.save!
  		minusPoints
  		flash[:success] = "post successfully updated"
  		redirect_to @assignment
  	else
  		if @assignment.points > current_user.points
  			flash[:danger] = "cannot use more points than you have"
  		end
  		render 'edit'
  	end
  end

  def choose
    byebug
  end

  def destroy
    @assignment  = Assignment.find(params[:id])
    u =  User.find(session[:user_id])
    p = @assignment.points +  u.points
    u.update(points: p)
    answers = Response.where(assignmentID: @assignment.id)
    answers.each do |x|
      Message.create(sender: current_user.id, recever: x.UID, subject: "Deleted asignment", message: "A question you responded to was deleted before a winner was chosen. We have given you half of the points the question was worth because of this inconvenice to you.", opened: false)
      sorryPonits = User.find(x.UID).points + (@assignment.points/2)
      User.find(x.UID).update(points: sorryPonits)
      x.delete
    end
    @assignment.delete
    redirect_to root_path
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

  def check_user(assignment)
  	unless current_user == User.find(assignment.UID)
  		redirect_to assignment
  	end	
  end

end
