class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params.require(:post).permit(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title))
	  redirect_to post_path(@post)
	end

	# require: the require method means that the params that get passed in must contain a key called "post"
	# permit: the permit methods means that the params hash may have whatever keys are called in the create/update method.

	def edit
	  @post = Post.find(params[:id])
	end
end
