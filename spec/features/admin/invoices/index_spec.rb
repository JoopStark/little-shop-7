require "rails_helper"

RSpec.describe "the invoice index" do
  it "lists all invoices and their attributes" do
    @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")
    @customer_2 = Customer.create!(first_name: "Samwise", last_name: "Gamgee")
    @customer_3 = Customer.create!(first_name: "Meridoc", last_name: "Brandybuck")

    @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1)
    @invoice_1l = Invoice.create!(status: "completed", customer: @customer_1)
    @invoice_2a = Invoice.create!(status: "in progress", customer: @customer_2)
    @invoice_2d = Invoice.create!(status: "in progress", customer: @customer_2)
    @invoice_3a = Invoice.create!(status: "cancelled", customer: @customer_3)
    @invoice_3b = Invoice.create!(status: "cancelled", customer: @customer_3)

    visit "/admin/invoices"
    save_and_open_page

    expect(page).to have_link("Invoice: #{@invoice_1k.id}")

    # click_link "Invoice: #{@invoice_1k.id}"

    # expect(current_path).to eq("admin/invoices/#{@invoice_1k.id}")
  end








end