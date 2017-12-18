class ProspectsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	before_action :set_prospect, only: [:edit, :update, :show, :destroy]
	def index
		@prospects = current_user.prospects
		@prospect = Prospect.new
	end

	def new
		@prospect = Prospect.new
	end

	def create
		@prospect = Prospect.new(prospect_params)
		@prospect.managed_by = current_user.id
		respond_to do |format|
			if @prospect.save
				format.html{ redirect_to prospects_path, notice: "Successfully created the Prospect" }
				format.js
			else
				format.html{render :new}
				format.js
			end
		end
	end

	def edit
		
	end

	def update
		if @prospect.update_attributes(prospect_params)
			redirect_to prospects_path
		else
			render action: "edit"
		end
	end

	def show
		
	end

	def destroy
		@prospect.destroy
		redirect_to prospects_path
	end

	private

	def set_prospect
		@prospect = Prospect.find(params[:id])
	end

	def prospect_params
		params.require(:prospect).permit(:full_name, :email, :mobile, :location, :stage_id, :managed_by)
	end
end
