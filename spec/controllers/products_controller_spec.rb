require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = {
      name: "Fish",
      description: "food",
      image_url: "https://www.gannett-cdn.com/presto/2018/09/10/PDTF/cba7a9ee-2e11-4707-9a46-cc4ec7a1d15d-Pepperoni_Pizza.jpg?width=534&height=401&fit=bounds&auto=webp",
      prices: 500,
    }
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
      @comment = "meh"
    end
    it 'displays pages of comments' do
      get :show

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
      get :edit
      expect(response).to be_ok
      expect(response).to render_template('products/edit')
    end
  end

  describe 'POST #create' do
    context "if product is saved" do
      it 'creates new products' do
        @product.save
        expect(response).to render_template('/products')
      end
    end

    context "if product is not saved" do
      it "renders new product form" do
        expect(response).to render_template('/products/new')
      end
    end  
  end

  describe 'PATCH #update' do

    context "if product is updated" do
      it "renders new product page" do
        @product.update(name: "Pizza")
        expect(response).to render_template('/products/1')
      end
    end

    context "if product is not updated" do
      it "redirects to product edit page" do
        expect(response).to render_template("/products/1/edit")
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes products' do
      @product.destroy
      expect(response).to redirect_to "/products"
    end
  end

end
