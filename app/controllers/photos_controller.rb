class PhotosController < ApplicationController

	before_action :set_user, :set_album, :authenticate_user!

	def show
		@photo = @album.photos.find(params[:id])
	end

	def create
		@photo = @album.photos.new(photo_params)
		if @photo.save 
			redirect_to user_album_path current_user, @album
		else
			render :new
		end
	end

	def edit
		if @user == current_user
			@photo = @album.photos.find(params[:id])
		else
			redirect_to :action => :show, :id => params[:id]
		end
	end

	def new
		@photo = @album.photos.new
	end

	def update
		@photo = @album.photos.find(params[:id])
		if @photo.update photo_params
			redirect_to :action => :show, :id => params[:id], :album_id => params[:album_id]
		else
			render :edit
		end
	end

	def destroy
		if @user == current_user 
			@photo = @album.photos.destroy(params[:id])
		end
		puts @user
		redirect_to :controller => :albums, :action => :show, :id => @album.id, :user_id => @user.id
	end

	def upvote
		@photo = @album.photos.find(params[:id])
		@photo.upvote_by current_user
		redirect_to user_album_photo_path(@user, @album, @photo)
	end

	def downvote
  		@photo = @album.photos.find(params[:id])
  		if current_user.voted_up_on? @photo
  			@photo.downvote_by current_user
  		end
  		redirect_to user_album_photo_path(@user, @album, @photo)
	end

	private 
	def photo_params 
		params.require(:photo).permit(:description, :image)
	end

	def set_album
		@album = Album.find(params[:album_id])	
	end

	def set_user
		@user = User.find(params[:user_id])
	end
end
