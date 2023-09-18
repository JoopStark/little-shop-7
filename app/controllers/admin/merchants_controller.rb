class Admin::MerchantsController < ApplicationController
  def index 
    @merchants = Merchant.all 
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
  end
  
  def update
    merchant = Merchant.find(params[:merchant_id])
    if params["change"] == "name"
      merchant.update(name: params[:name])
      redirect_to "/admin/merchants/#{merchant.id}"
      flash[:alert] = "Information has been successfully updated"
    else  
      merchant.update(status: params[:status])
      redirect_to "/admin/merchants"  
    end 
  end

  def new 
  end

  def create 
    merchant = Merchant.new(name: params[:name])
    if merchant.save
      redirect_to "/admin/merchants"
    else 
      flash[:error] = "Error: All fields must be filled in to submit"
      redirect_to "/admin/merchants/new"
    end
  end
end