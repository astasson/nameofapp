require 'rails_helper'

describe User do
  context "email address missing" do
    it "is not valid without an email address" do
      expect(User.new(password: "password")).not_to be_valid
    end
  end

  context "password missing" do
    it "is not valid without a password" do
      expect(User.new(email: "tom@gmail.com")).not_to be_valid
    end
  end
end
