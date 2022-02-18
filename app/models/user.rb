class User < ApplicationRecord
	has_many :authored_courses, class_name: 'Course', foreign_key: 'author_id'
	has_and_belongs_to_many :talent_courses, class_name: 'User', join_table: 'courses_talents', foreign_key: 'user_id'

	before_destroy :reassign_course_author


	def reassign_course_author
		debugger
		self.authored_courses.each do |course|
			course.re_assign_author
		end
	end
end
