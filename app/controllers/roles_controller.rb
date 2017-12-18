class RolesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	# def index
	# 	@roles = Role.all
	# end

	# def new
	# 	@role = Role.new
	# end

	# def create
	# 	@role = Role.new(role_params)
	# 	if @role.save
	# 		redirect_to roles_path, notice: "Successfully created the role"
	# 	else
	# 		render action: "new"
	# 	end
	# end
end
