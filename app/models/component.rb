class Component < ActiveRecord::Base
  has_many :component_ingredients
  has_many :ingredients, through: :component_ingredients

  validates_presence_of :name

  # look up before_destroy
end
