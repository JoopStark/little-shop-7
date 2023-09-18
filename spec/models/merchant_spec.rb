require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do
    it { should have_many :items }
    it { should have_many(:invoices).through(:items) }
    it { should have_many :invoices }
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe "top 5 customers" do
    before (:each) do
      load_test_data
    end

    it "can display top customers" do
      expect(@merchant1.top_customers).to eq([@customer_1, @customer_2])
    end
  end

  describe "self.top_merchants" do
    before (:each) do
      load_best_test_data
    end
    it "can return the top five merchants" do
      expect(Merchant.top_merchants[0].id).to eq(@merchant2.id)
      expect(Merchant.top_merchants[1].id).to eq(@merchant3.id)
      expect(Merchant.top_merchants[2].id).to eq(@merchant5.id) #5 being higher than 7 means query is also looking at date
      # 6 is missing which means it is only looking at completed invoices
      expect(Merchant.top_merchants[3].id).to eq(@merchant7.id)
      expect(Merchant.top_merchants[4].id).to eq(@merchant1.id)
      expect(Merchant.top_merchants.count).to eq(5)
    end

    it "also finds their best day" do
      expect(@merchant2.best_day).to eq("Monday, March 27, 2023")
    end
  end
end