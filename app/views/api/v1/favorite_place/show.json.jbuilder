json.success true
if @favorite_place
  json.favorite_place do
    json.id @favorite_place.place.id
    json.name @favorite_place.place.name
    json.address do
      json.id @favorite_place.place.address.id
      json.address @favorite_place.place.address.address
      json.longitude @favorite_place.place.address.longitude
      json.latitude @favorite_place.place.address.latitude
    end
    json.pictures @favorite_place.place.pictures do |picture|
      json.id picture.id
      json.url picture.url
    end
  end
else
  json.favorite_place {}
end