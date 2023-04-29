class Public::PostsController < ApplicationController
  
  def index
   @post = Post.all
  end
  
  def show
   @post = Post.find(params[:id])
  end
  
  def new
   @post = Post.new
  end
  
 def create
  @post = Post.new(post_params)
   if @post.save
     redirect_to public_posts_path
   else
    @post = Post.all
    render :index
   end
 end
 
 def update
    @post =Post.find(params[:id])
 end
  
end
