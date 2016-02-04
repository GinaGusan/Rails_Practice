class PhotosController < ApplicationController

	before_action :set_album

	def show
		@photo = @album.photos.find(params[:id])
	end

	def create
		@photo = @album.photos.new(photo_params)
		if @photo.save 
			redirect_to album_path @album
		else
			render :new
		end
	end

	def edit
		@photo = @album.photos.find(params[:id])
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
		@photo = @album.photos.destroy(params[:id])
		redirect_to album_path @album
	end

	private 
	def photo_params 
		params.require(:photo).permit(:description)
	end

	def set_album
		@album = Album.find(params[:album_id])
		
	end
end
