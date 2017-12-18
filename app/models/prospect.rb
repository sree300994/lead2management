class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, foreign_key: :managed_by
	validates_presence_of :full_name, :email, :mobile, :location
	validates_uniqueness_of :mobile, :email
	before_create :stage_save
	before_save :stage_check

	def stage_save
		stage = Stage.find_by(name: "New Opportunity").id
		self.stage_id = stage
	end

	def stage_check
		# new_opportunity = Stage.find_by(name: "New Opportunity").id
		won = Stage.find_by(name: "Won").id
		# if self.stage_id == new_opportunity
		# 	binding.pry
		# 	self.save
		if self.stage_id == won
			# user = self.user
			# binding.pry
			# user.prospects.each do |prospect|
				customer = Customer.new
				customer.full_name = self.full_name
				customer.email = self.email
				customer.mobile = self.mobile
				customer.location = self.location
				customer.managed_by = self.managed_by
				# binding.pry
				customer.save
			# end
		end
	end
end
