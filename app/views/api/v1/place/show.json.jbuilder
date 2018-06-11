json.success true
json.place do
  json.id @place.id
  json.name @place.name
  json.pictures @place.pictures do |picture|
    json.id picture.id
    json.url picture.url
  end
  json.address do
    json.id @place.address.id
    json.longitude @place.address.longitude
    json.latitude @place.address.latitude
    json.address_type do
      json.id @place.address.address_type.id
      json.name @place.address.address_type.name
    end
  end
  json.place_types @place.place_categories do |category|
    json.id category.id
    json.name category.name
  end
end