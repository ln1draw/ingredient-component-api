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

  describe 'delete_component' do
    before(:each) do
      @a = Component.create(name: 'a')
      @b = Component.create(name: 'b')
      # let(:ingredient_with_components) { create(:ingredient_with_components) }
      @ingredient_with_components = Ingredient.create(name: 'ab', components: [@a, @b])
    end

    it 'removes the component from ingredients that utilize it' do
      length = @ingredient_with_components.components.length
      Ingredient.delete_component(@a.id)
      @ingredient_with_components.reload
      expect(@ingredient_with_components.components.length).to eq(length - 1)
    end

    it 'changes an altered Ingredient to unverified' do
      @ingredient_with_components.update(verified: true)
      Ingredient.delete_component(@a.id)
      @ingredient_with_components.reload
      expect(@ingredient_with_components.verified).to eq(false)
    end

    it 'deletes the ingredient if it has no more components' do
      before = Ingredient.count
      Ingredient.delete_component(@a.id)
      Ingredient.delete_component(@b.id)
      expect(Ingredient.count).to eq(before - 1)
    end
  end
end