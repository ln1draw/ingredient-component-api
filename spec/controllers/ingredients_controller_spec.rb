require 'spec_helper'
describe IngredientsController do
  describe 'GET new' do
    it 'is successful' do
      get :new
      expect(response).to be_successful
    end
  end
  describe 'POST create' do
    context 'with valid attributes' do
      let(:valid_attributes) { { name: 'a name'} }
      it 'redirects' do
        post :create, ingredient: valid_attributes
        expect(response.status).to eq 302
      end

      it 'increases the ingredient count by 1' do
        expect { post :create, ingredient: valid_attributes }.to change(Ingredient, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { name: ''} }
      it 'renders the new template' do
        post :create, ingredient: invalid_attributes
        expect(response).to render_template :new
      end

      it 'does not increase the ingredient count' do
        expect { post :create, ingredient: invalid_attributes }.to change(Ingredient, :count).by(0)
      end
    end
  end
end