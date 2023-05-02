class Admin::PostsController < ApplicationController
   def index
    @posts = Post.all.joins(:customer).includes(:genre)
    @posts = @posts.where('customers.name like ?', "%#{params[:customer_name]}%") if params[:customer_name].present?
    @posts = @posts.where(genre_id: params[:genre_id]) if params[:genre_id].present?
   end
  
  def show
   @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "updated!"
      redirect_to admin_post_path(@post.id)
    else
      flash.now[:alert] = "not updated!"
      render :edit
    end
  end
 
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "created!"
      redirect_to admin_post_path(post.id)
    else
      flash.now[:alert] = "not created"
      render :new
    end
  end
 
 def edit
  @post = Post.find(params[:id])
 end
 
 private
 
 def post_params
   params.require(:post).permit(:liquor_name, :liquor_content, :comment, :genre_id)
 
 end

end
