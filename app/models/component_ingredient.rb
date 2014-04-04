class ComponentIngredient < ActiveRecord::Base
  belongs_to :component 
  belongs_to :ingredient

  def self.delete_component(component_id)
    component_ingredients = ComponentIngredient.where(component_id: component_id)
    ingredient_ids = []
    component_ingredients.each do |ci|
      ingredient_ids << ci.ingredient_id
      ci.destroy
    end
    return ingredient_ids
  end
end