json.success true
json.places @places do |place|
  json.id place.id
  json.name place.name
  json.address do
    json.id place.address.id
    json.address place.address.address
    json.longitude place.address.longitude
    json.latitude place.address.latitude
    json.address_type do
      json.id place.address.address_type.id
      json.name place.address.address_type.name
    end
  end
  json.pictures place.pictures do |picture|
    json.id picture.id
    json.url picture.url
  end
end