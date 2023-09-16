class MerchantInvoicesController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @merchant_invoices = @merchant.invoices  #remove, uses @merchant.invoices in webpage
  end

  def show
    @invoice = Invoice.find(params[:invoice_id])
  end

  def update
    invoice_item = InvoiceItem.find(params[:in_item_id])
    invoice_item.update(status: params[:status])
    redirect_to "/merchants/#{params[:merchant_id]}/invoices/#{params[:invoice_id]}"
  end
end