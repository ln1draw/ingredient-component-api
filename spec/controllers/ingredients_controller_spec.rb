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
      before(:each) do
        Component.create(name: 'a', id: 1)
        Component.create(name: 'b', id: 2)
      end

      let(:valid_attributes) { { name: 'a name', components: [1, 2] } }
      it 'redirects' do
        post :create, ingredient: valid_attributes
        expect(response.status).to eq 302
      end

      it 'increases the ingredient count by 1' do
        expect { post :create, ingredient: valid_attributes }.to change(Ingredient, :count).by(1)
      end

      it 'adds the components to the ingredient' do
        post :create, ingredient: valid_attributes
        expect(Ingredient.last.components.length).to be(2)
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

  describe 'PUT update' do
    let(:ingredient) { create(:ingredient) }
    context "valid attributes" do 
      it "located the requested ingredient" do 
        put :update, id: ingredient, ingredient: ingredient.attributes
        assigns(:ingredient).should eq(ingredient) 
      end

      it "changes the ingredient's attributes" do 
        put :update, id: ingredient, ingredient: {name: 'New Name'}
        ingredient.reload 
        expect(ingredient.name).to eq('New Name')
      end

      it "redirects to the updated ingredient" do 
        put :update, id: ingredient, ingredient: {name: 'New Name'}
        expect(response).to redirect_to ingredient
      end
    end

    context "invalid attributes" do 
      it "does not change the ingredient's attributes" do 
        put :update, id: ingredient, ingredient: {name: ''}
        ingredient.reload
        expect(ingredient.name).to_not eq('')
      end
      it "renders the edit template" do
        put :update, id: ingredient, ingredient: {name: ''}
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @ingredient = Ingredient.create(name: 'They should all be destroyed!')
    end

    it 'deletes the ingredient' do
      count = Ingredient.all.length
      delete :destroy, id: @ingredient
      expect(Ingredient.all.length).to eq(count - 1)
    end

    it 'redirects to ingredients#index' do
      delete :destroy, id: @ingredient
      expect(response).to redirect_to ingredients_path
    end
  end
end