class Customer < ActiveRecord::Base

	belongs_to :user, foreign_key: :managed_by
	after_create :empty_prospects

	def empty_prospects
		# binding.pry
		user = self.user
		# binding.pry
		# Prospect.delete(user.prospects.pluck(:id))
		user.prospects.each do |prospect|
			if prospect.full_name == self.full_name
				prospect.delete
			end
			# break
		end
	end
end
