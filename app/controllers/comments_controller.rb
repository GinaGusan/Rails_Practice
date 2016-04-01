class CommentsController < ApplicationController

	before_action :set_user, :set_photo, :set_album, :authenticate_user!

	def index
		@comments = @photo.comments
	end

	def show
		@comment = @photo.comments.find(params[:id])
	end

	def create
		@comment = @photo.comments.new(comment_params)
		if @comment.save 
			redirect_to user_album_photo_path(@album.user.id, @album, @photo)
		else
			render :new
		end
	end

	def edit
		@comment = @photo.comments.find(params[:id])
	end

	def new
		@comment = @photo.comments.new
		respond_to :html, :js
	end

	def update
		@comment = @photo.comments.find(params[:id])
		if @comment.update comment_params
			redirect_to :controller => 'photos', :action => 'show', :id => @photo, :user_id => @album.user.id, :album_id => @album
		else
			render :edit
		end
	end

	def destroy
		if @user == current_user
			@comment = @photo.comments.destroy(params[:id])
		end
		puts @user
		redirect_to :controller => :photos, :action => :show, :id => @photo.id, :user_id => current_user.id
	end

	private 
	def comment_params 
		params.require(:comment).permit(:content, :photo_id).merge(:owner => current_user.id)
	end

	def set_photo
		@photo = Photo.find(params[:photo_id])
	end

	def set_album
		@album = Album.find(params[:album_id])
	end

	def set_user
		@user = current_user
	end

end
