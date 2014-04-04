json.array!(@components) do |component|
  json.extract! component, :id, :name, :verified
  json.url component_url(component, format: :json)
end
