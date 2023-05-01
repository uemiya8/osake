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
  @post.customer_id = current_customer.id
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
 
 private
 
 def post_params
  params.require(:post).permit(:liquor_name, :liquor_content, :comment, :genre_id)
 end

  
end
