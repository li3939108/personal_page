class GradeController < ApplicationController
	def index
	end
	def search
		@student = Student.find( params[:q].to_i )
	end
end
