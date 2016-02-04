class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save 
			redirect_to comments_path
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update comment_params
			redirect_to :action => :show, :id => params[:id]
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.destroy(params[:id])
		redirect_to :action => :index
	end

	private 
	def comment_params 
		params.require(:comment).permit(:content)
	end
end
