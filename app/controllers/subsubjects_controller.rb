class SubsubjectsController < ApplicationController

def show
	@subsubject = Subsubject.find(params[:id])
end

end
