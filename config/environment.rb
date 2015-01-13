# Load the Rails application.
require File.expand_path('../application', __FILE__)
	Rails.application.routes.default_url_options[:host] = 'localhost:3000'
# Initialize the Rails application.
GoogleAuthExample::Application.initialize!
