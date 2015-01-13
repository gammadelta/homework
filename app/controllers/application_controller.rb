class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :subs

  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end

  def subs
  @subs = Subject.all.map { |s| (["--"+s.name, 0]) }
 	index = 1
 	@subs.length.times do |x|
		 Subsubject.where(subjectID: x+1).each do |i|
			@subs.insert(index, [i.name, i.id])
			index+= 1
		end
		index+= 1
	end
	return @subs
end
end
