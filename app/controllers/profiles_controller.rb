class ProfilesController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all 
	end

	def show 
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def update 
		@user = current_user
		if @user.update user_params
			redirect_to :action => :show, :id => params[:id]
		else
			render :edit
		end
	end

	def destroy
		@user = User.delete(params[:id])
		redirect_to :action => :index
	end

	private
	def user_params 
		params.require(:user).permit(:email, :password, :name, :image)
	end
end
