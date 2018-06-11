json.success true
json.favorite_places @favorite_places do |fp|
  json.id fp.id

  json.place do
    json.id fp.place.id
    json.name fp.place.name
    json.address do
      json.id fp.place.address.id
      json.address fp.place.address.address
      json.longitude fp.place.address.longitude
      json.latitude fp.place.address.latitude
      json.address_type do
        json.id fp.place.address.address_type.id
        json.name fp.place.address.address_type.name
      end
    end
    json.pictures fp.place.pictures do |picture|
      json.id picture.id
      json.url picture.url
    end
  end
end