require 'rails_helper'

describe OrdersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do
    before do
      sign_in @user
    end

    it 'displays index of all orders' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
end
