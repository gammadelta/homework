class ResponsesController < ApplicationController

	def create
   		#checks to make sure that the response has some text
   		if (params[:response][:response]) != ""
   			r = Response.create(params[:response].permit!)
   			r.update(selected: false, UID: current_user.id)
   			m = "#{current_user.userName} responded with  #{r.response}"  
   			#creates a message for the poster to notify them
            Message.create(sender: current_user.id,
   			 			  recever: User.find(Assignment.find(r.assignmentID).UID).id, 
   			 			  subject: "Someone posted a response to one of your questions", 
   			 			  message: m, 
   			 			   opened: false )
            redirect_to :back
   		end
	end
end
