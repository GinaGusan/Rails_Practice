class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def create
		@album = Album.new(album_params)
		if @album.save 
			redirect_to album_path
		else
			render :new
		end
	end

	def edit
		@album = Album.find(params[:id])
	end

	def new
		@album = Album.new
	end

	def update
		@album = Album.find(params[:id])
		if @album.update album_params
			redirect_to :action => :show, :id => params[:id]
		else
			render :edit
		end
	end

	def destroy
		@album = Album.destroy(params[:id])
		redirect_to :action => :index
	end

	private 
	def album_params 
		params.require(:album).permit(:description, :title)
	end
end
