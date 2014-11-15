json.array!(@items) do |item|
  json.extract! item, :id, :recipe_id, :ingredient_id, :user_id, :amount, :measure
  json.url item_url(item, format: :json)
end
