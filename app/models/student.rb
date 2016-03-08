class Student < ActiveRecord::Base
	validates :uin, length: {is: 9}
	has_many :grades
end
