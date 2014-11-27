class Message < ActiveRecord::Base
	validates :message,  presence: true, length: { minimum: 10 }
	validates :subject,  presence: true, length: { minimum: 1 }
end
