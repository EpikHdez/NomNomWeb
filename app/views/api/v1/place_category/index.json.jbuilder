json.success true
json.place_categories @place_categories do |place_category|
  json.id place_category.id
  json.name place_category.name
end