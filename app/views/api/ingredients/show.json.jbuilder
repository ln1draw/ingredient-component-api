json.ingredient {
  json.id @ingredient.id
  json.name @ingredient.name
  json.verified @ingredient.verified
  components_array = []
  @ingredient.components.each do |component|
    components_array << component.id
  end
  json.components components_array
}