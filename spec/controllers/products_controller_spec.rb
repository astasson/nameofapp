require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = Product.create(
      name: "Fish",
      description: "food",
      image_url: "https://www.gannett-cdn.com/presto/2018/09/10/PDTF/cba7a9ee-2e11-4707-9a46-cc4ec7a1d15d-Pepperoni_Pizza.jpg?width=534&height=401&fit=bounds&auto=webp",
      prices: 500,
    )
  end
  describe 'GET #index' do
    it 'displays all products' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before do
      @comment = Comment.create(
        user_id: 1,
        body: "meh",
        rating: 3,
        product_id: @product.id,
      )
    end
    it 'displays pages of comments' do

    end
  end

  describe 'GET #new' do
    it 'displays new product form' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('products/new')
    end
  end

  describe 'GET #edit' do
    it 'displays product editing form' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('products/edit')
    end
  end

  describe 'POST #create' do
    context "if product is saved" do
      it 'creates new products' do
        post :create, params: { product: { description: "New product"} }
        expect(response).to render_template('new')
      end
    end

    context "if product is not saved" do
      it "renders new product form" do
        post :create, params: { product: { description: nil } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    context "if product is updated" do
      it "renders new product page" do
        put :update, params: { id: @product.id, product: { name: "Pizza" } }
        expect(response).to redirect_to('/products/1')
      end
    end

    context "if product is not updated" do
      it "redirects to product edit page" do
        put :update, params: { id: @product.id, product: { name: nil } }
        expect(response).to render_template("edit")
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes products' do
      delete :destroy, params: { id: @product.id }
      @product.destroy
      expect(response).to redirect_to "/products"
    end
  end

end
