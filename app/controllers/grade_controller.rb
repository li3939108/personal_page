class GradeController < ApplicationController
	def index
		@name = params[:name]
		@course = params[:course]
	end
	def search
		uin = params[:q].to_i
		if params[:c] == 'ECEN468' or params[:c] == 'ECEN248' and params[:commit] == 'Update'
			grade = Grade.find_by(student_id: uin, course: params[:c], name: params[:n] ) 
			
			if grade == nil and uin >= 100000000 and uin <= 999999999 
				Grade.create(student_id: uin, course: params[:c], name: params[:n] , score: params[:v])
			else
				grade.update(score: params[:v] )
			end
			@out = 'Saved'
		elsif params[:commit] == 'Delete'
			grade = Grade.find_by(student_id: uin, course: params[:c], name: params[:n] ) 
			if grade == nil
				@out = 'No record, nothing deleted'
			else
				grade.destroy 
				@out = 'Deleted'
			end
		else 
			@out = nil 
		end
		@student = Student.find( params[:q].to_i )
		@grades = @student.grades.all
	end
end
