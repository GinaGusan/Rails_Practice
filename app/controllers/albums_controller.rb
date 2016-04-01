class AlbumsController < ApplicationController

	before_action :set_user, :authenticate_user!

	def index
		@albums = @user.albums.all
	end

	def show
		@album = @user.albums.find(params[:id])
	end

	def create
		@album = current_user.albums.new(album_params)
		if @album.save 
			redirect_to user_album_path @user, @album.id
		else
			render :new
		end
	end

	def edit
		@album = current_user.albums.find(params[:id])
	end

	def new
		@album = current_user.albums.new
	end

	def update
		@album = current_user.albums.find(params[:id])
		if @album.update album_params
			redirect_to :action => :show, :id => params[:id], @user => params[:user_id]
		else
			render :edit
		end
	end

	def destroy
		@album = current_user.albums.destroy(params[:id])
		redirect_to user_path @user
	end

	private 
	def album_params 
		params.require(:album).permit(:description, :title)
	end

	def set_user
		@user = User.find(params[:user_id])
	end
end
