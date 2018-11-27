require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { User.create!(email: "tim@gmail.com", password: "vroom34") }
  let(:product) { Product.create!(name: "Table")}

  describe 'POST #create' do
    before do
      sign_in user
    end

    it 'creates new comment' do
      post :create, params: { product_id: product.id, comment: { body: "It's alright", rating: 4 } }
      expect(response).to have_http_status(302)
    end
  end


end
