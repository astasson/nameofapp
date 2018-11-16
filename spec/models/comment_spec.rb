require 'rails_helper'

describe Comment do
  context "no user id with comment" do
    it "missing user id" do
      expect(Comment.new(rating: 3)).not_to be_valid
    end
  end

  context "no rating with comment" do
    it "missing product rating" do
      expect(Comment.new(user_id: 1)).not_to be_valid
    end
  end
end
