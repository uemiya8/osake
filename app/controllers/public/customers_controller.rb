class Public::CustomersController < ApplicationController

 def show
  @customer = Customer.find(params[:id])
  @posts = @customer.posts
 end
 
 def edit
  @customer = current_customer
 end
 
 def create
  @customer = current_customer
  if @customer.save
    flash[:notice] = "created!"
    redirect_to customer_path(@customer.id)
  else
    @customer = Customer.all
    flash.now[:alert] = "not created"
    render :edit
  end
 end
  
  def update
    @customer = current_customer
     if  @customer.update(customer_params)
      flash[:notice] = "更新できました。"
      redirect_to public_customer_path(@customer)
     else
      @customer = Customer.all
      flash.now[:alert] = "更新できませんでした。"
      render :edit
     end
  end
  
  def unsubscribe
   @customer = current_customer
  end
  
  def withdraw
   @customer = current_customer
   @customer.update(is_deleted: true)
   reset_session
   redirect_to root_path
  end
  
  def customer_params
  params.require(:customer).permit(:name, :email)
  
  end
end
