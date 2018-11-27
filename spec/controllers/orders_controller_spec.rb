require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) { User.create!(email: "tim@gmail.com", password: "vroom34") }

  describe 'GET #index' do
    before do
      sign_in user
    end

    it 'displays index of all orders' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
end
