require 'spec_helper'

describe Component do 
  let(:component) { create(:component) }
  describe 'validates' do 
    it 'valid data' do 
      expect(component).to be_valid
    end

    it 'presence of name' do
      component.update(name: nil)
      expect(component.errors[:name]).to include "can't be blank"
    end

    it "'verified' defaults to false" do 
      expect(component.verified). to be(false)
    end

    it 'uniqueness of name' do
      component.update(name: 'Boring Name')
      expect(build(:component, name: 'Boring Name')).to be_invalid
    end
  end
end