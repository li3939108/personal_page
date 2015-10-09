class GradeController < ApplicationController
	def index
	end
	def search
		@student = Students.find( params[:q].to_i )
	end
end
