FactoryGirl.define do
  factory :component do 
    name 'corn'
  end

  factory :ingredient_with_component do 
    name 'ab'
    components [1, 2]
  end

  factory :ingredient do 
    name 'corn syrup'
  end
end