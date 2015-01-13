class MessagesController < ApplicationController
	def show
		@message = Message.find(params[:id])
		if current_user.id == @message.recever
			@message.update(opened: true)
			@from = User.find(@message.sender).userName
			@text = @message.message
			@subject = @message.subject
		else
			redirect_to root_path
		end
	end

	def index
		@messages = Message.where(recever: current_user.id).order(created_at: :desc)
	end

	def create
		m = Message.new(params[:message].permit!)
		if m.save
			m.save!
			m.update(sender: current_user.id, opened: false)
			redirect_to :back,  :flash => { :success => "Message successfully sent" }
		else
			redirect_to :back,  :flash => { :danger => "Message wast not successfully sent. You must have a subject and a message. " }
		end
	end

	def destroy
		#finds the message then redirects back to the inbox
		Message.find(params[:id]).delete
		redirect_to inbox_path
	end
end
