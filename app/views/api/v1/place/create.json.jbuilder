json.success @success

if !@success
  json.errors @errors
else
  json.place do
    json.id @place.id
    json.name @place.name
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
end
