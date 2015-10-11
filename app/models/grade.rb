class Grade < ActiveRecord::Base
	validates :student_id, length: {is: 9}
	validates :score, presence: true
	validates :course, presence: true
	validates :name, presence: true
	belongs_to :student
end
