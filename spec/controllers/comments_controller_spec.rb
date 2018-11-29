require 'rails_helper'

describe CommentsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  let(:product) { Product.create!(name: "Table")}

  describe 'POST #create' do
    before do
      sign_in @user
    end

    it 'creates new comment' do
      post :create, params: { product_id: product.id, comment: { body: "It's alright", rating: 4 } }
      expect(response).to have_http_status(302)
    end
  end


end
