class SubjectsController < ApplicationController

def show
	@sub = Subject.find(params[:id])
end

end
