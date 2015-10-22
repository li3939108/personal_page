class GradeController < ApplicationController
	def index
		@name = params[:name]
		@course = params[:course]
	end
	def search
		uin = params[:q].strip.to_i
		course = params[:c].strip if params[:c] != nil
		name = params[:n].strip if params[:n] != nil
		commit = params[:commit].strip
		score = params[:v].strip if params[:v] != nil
		if course == 'ECEN468' or course == 'ECEN248' and commit == 'Update'
			grade = Grade.find_by(student_id: uin, course: course, name: name ) 
			
			if grade == nil and uin >= 100000000 and uin <= 999999999 
				Grade.create(student_id: uin, course: course, name: name , score: score)
			else
				grade.update(score: score )
			end
			@out = 'Saved'
			@student = Student.find( uin )
			@grades = @student.grades.all
		elsif commit == 'Delete'
			grade = Grade.find_by(student_id: uin, course: course, name: name ) 
			if grade == nil
				@out = 'No record, nothing deleted'
			else
				grade.destroy 
				@out = 'Deleted'
			end
			@student = Student.find( uin )
			@grades = @student.grades.all
		elsif commit == 'Search'
			@student = Student.find( uin )
			@grades = @student.grades.all.select do |g| 
				(course == '' or g.course == course) and 
				(name == '' or g.name == name )
			end
			@out = "#{view_context.pluralize(@grades.length, 'record') } found"
		else 
			@out = 'No operation'
			@student = Student.find( uin )
			@grades = @student.grades.all
		end
	end
end
