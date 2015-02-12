json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :kind
  json.url ingredient_url(ingredient, format: :json)
end
