json.success true
json.places @places do |place|
  json.id place.id
  json.name place.name
  json.pictures place.pictures do |picture|
    json.id picture.id
    json.url picture.url
  end
end