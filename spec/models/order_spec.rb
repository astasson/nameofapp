require 'rails_helper'

describe Order do
  context "user id missing" do
    it "no user id present with order" do
      expect(Order.new(product_id: 1)).not_to be_valid
    end
  end

  context "product id missing" do
    it "no product id present with order" do
      expect(Order.new(user_id: 1)).not_to be_valid
    end
  end
end
