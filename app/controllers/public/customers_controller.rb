class Public::CustomersController < ApplicationController

 def show
  @customer = current_customer
 end
 
 def edit
  @customer = current_customer
 end
 
 def create
  @customer = current_customer
  if @customer.save
    redirect_to customer_path(@customer.id)
  else
    @customer = Customer.all
    render :edit
  end
 end
  
  def update
    @customer = current_customer
     if  @customer.update(customer_params)
       redirect_to public_customer_path(@customer)
     else
      @customer = Customer.all
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
