class Ecen248Controller < ApplicationController
	def show
		# your code goes here
		redirect_to 'http://people.tamu.edu/~li3939108/ecen248', :status => :moved_permanently 
	end
end
