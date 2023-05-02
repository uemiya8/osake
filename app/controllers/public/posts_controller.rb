class Public::PostsController < ApplicationController
  
  def index
    @posts = Post.all.joins(:customer).includes(:genre)
    @posts = @posts.where('customers.name like ?', "%#{params[:customer_name]}%") if params[:customer_name].present?
    @posts = @posts.where(genre_id: params[:genre_id]) if params[:genre_id].present?
  end
  
  def show
   @post = Post.find(params[:id])
  end
  
  def edit
   @post = Post.find(params[:id])
  end
  
  def new
   @post = Post.new
  end
  
  def create
    @post = current_customer.posts.build(post_params)
    if @post.save
      flash[:notice] = "created"
      redirect_to public_posts_path
    else
      flash.now[:alert] = "not created"
      render :new
    end
  end
 
 def update
    @post =Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "updated!"
      redirect_to public_post_path(@post)
    else
      flash.now[:alert] = "not updated!"
      render :edit
    end
 end
 
 private
 
 def post_params
  params.require(:post).permit(:liquor_name, :liquor_content, :comment, :genre_id)
 end

  
end
