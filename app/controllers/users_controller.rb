class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!
	def index
		@users = User.order('created_at DESC')
		@user = User.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html {redirect_to users_path, notice: "Successfully created the User"}
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
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render action: "edit"
		end
	end

	def show
		
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :mobile, :role_id)
	end
end
