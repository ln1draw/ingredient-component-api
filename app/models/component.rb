class Component < ActiveRecord::Base
  has_many :component_ingredients
  has_many :ingredients, through: :component_ingredients

  validates :name, uniqueness: true, presence: true

  # look up before_destroy
end
