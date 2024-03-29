class Admin::CustomersController < ApplicationController
  
  
 def index
  @customer = Customer.all
 end
  
 def show
  @customer = Customer.find(params[:id])
 end
  
 def edit
  @customer = Customer.find(params[:id])
 end
 
 def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
  flash[:notice] = "削除しました。"
  redirect_to admin_customers_path
 end
  
 def update
  @customer = Customer.find(params[:id])
  if  @customer.update(customer_params)
   flash[:notice] = "更新できました。"
   redirect_to admin_customer_path
  else
   @customer = customer.all
    render :edit
  end
 end
  
 private
  
 def customer_params
  params.require(:customer).permit(:name, :email, :is_deleted)
 end
 
 
end
