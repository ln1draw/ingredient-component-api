class ComponentIngredient < ActiveRecord::Base
  belongs_to :component 
  belongs_to :ingredient
end