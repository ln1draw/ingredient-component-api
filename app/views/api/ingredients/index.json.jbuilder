json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :verified
  json.components ingredient.components
  json.url ingredient_url(ingredient, format: :json)
end
