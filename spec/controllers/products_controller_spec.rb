require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'displays all products' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
end
