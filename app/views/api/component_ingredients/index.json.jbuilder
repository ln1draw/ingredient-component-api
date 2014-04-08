json.array!(@component_ingredients) do |component_ingredient|
  json.extract! component_ingredient, :id, :component_id, :ingredient_id
  json.url component_ingredient_url(component_ingredient, format: :json)
end
