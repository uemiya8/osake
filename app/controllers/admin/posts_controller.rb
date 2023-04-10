class Admin::PostsController < ApplicationController
   def index
   @post = Post.new
   @post = Post.all
  end
  
  def show
   @post = Post.find(params.id)
  end
  
  def update
  @post = Post.find(params[:id])
   @post.update(post_params)
   redirect_to admin_post_path(@post.id)
 end
 
 def create
  post = Post.new(post_params)
  post.save
  redirect_to admin_post_path(post.id)
 end
 
 def edit
  @liquor = Liquor.find(params[:id])
 end
 
 private
 
 def post_params
   params.require(:post).permit(:name, :image)
 
 end

end
