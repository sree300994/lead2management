class StagesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	before_action :set_stage, only: [:edit, :show, :update, :destroy]
	def index
		@stages = Stage.all
		@stage = Stage.new
	end

	def new
		@stage = Stage.new
	end

	def create
		@stage = Stage.new(stage_params)
		if @stage.save
			redirect_to stages_path, notice: "Successfully created the Stage"
		else
			render action: "new"
		end
	end

	def edit
		
	end

	def update
		if @stage.update_attributes(stage_params)
			redirect_to @stage, notice: "Successfully updated the Stage"
		else
			render action: "edit"
		end
	end

	def show
		
	end

	def destroy
		@stage.destroy
		redirect_to stages_path, notice: "Successfully deleted the Stage"
	end

	private

	def set_stage
		@stage = Stage.find(params[:id])
	end

	def stage_params
		params.require(:stage).permit(:name, :description, :interest_level)
	end
end
