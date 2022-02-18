class Course < ApplicationRecord
	belongs_to :author, class_name: 'User', foreign_key: 'author_id'
	has_and_belongs_to_many :talents, class_name: 'User', join_table: 'courses_talents'

	def re_assign_author
		new_id = self.talents.where.not(id: self.author_id)&.first&.id
		new_id = User.where.not(id: self.author_id)&.first&.id
		self.author_id = new_id
		self.save
	end
end
