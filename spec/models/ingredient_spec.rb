require 'spec_helper'

describe Ingredient do 
  let(:ingredient) { create(:ingredient) }
  describe 'validates' do 
    it 'valid data' do 
      expect(ingredient).to be_valid
    end

    it 'presence of name' do
      ingredient.update(name: nil)
      expect(ingredient.errors[:name]).to include "can't be blank"
    end

    it "'verified' defaults to false" do 
      expect(ingredient.verified). to be(false)
    end

    it 'uniqueness of name' do
      ingredient.update(name: 'Boring Name')
      expect(build(:ingredient, name: 'Boring Name')).to be_invalid
    end
  end
end