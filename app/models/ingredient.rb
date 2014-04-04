class Ingredient < ActiveRecord::Base
  has_many :component_ingredients
  has_many :components, through: :component_ingredients

  validates :name, uniqueness: true, presence: true

  def self.delete_component(component_id)
    ingredient_ids = ComponentIngredient.delete_component(component_id)
    ingredient_ids.each do |ii|
      ingredient = Ingredient.find(ii)
      ingredient.components.delete(Component.find(component_id))
      if ingredient.components.length == 0
        ingredient.destroy
      else
        ingredient.update(verified: false)
      end
    end
  end
end
