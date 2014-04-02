require 'spec_helper'

describe ComponentsController do
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
        post :create, component: valid_attributes
        expect(response.status).to eq 302
      end

      it 'increases the component count by 1' do
        expect { post :create, component: valid_attributes }.to change(Component, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { name: ''} }
      it 'renders the new template' do
        post :create, component: invalid_attributes
        expect(response).to render_template :new
      end
      it 'does not increase the Component count' do
        expect { post :create, component: invalid_attributes }.to change(Component, :count).by(0)
      end
    end
  end

  describe 'PUT update' do
    let(:component) { create(:component) }
    context "valid attributes" do 
      it "located the requested component" do 
        put :update, id: component, component: component.attributes
        assigns(:component).should eq(component) 
      end

      it "changes the component's attributes" do 
        put :update, id: component, component: {name: 'New Name'}
        component.reload 
        expect(component.name).to eq('New Name')
      end

      it "redirects to the updated component" do 
        put :update, id: component, component: {name: 'New Name'}
        expect(response).to redirect_to component
      end
    end

    context "invalid attributes" do 
      it "does not change the component's attributes" do 
        put :update, id: component, component: {name: ''}
        component.reload
        expect(component.name).to_not eq('')
      end
      it "renders the edit template" do
        put :update, id: component, component: {name: ''}
        expect(response).to render_template :edit
      end
    end
  end
end