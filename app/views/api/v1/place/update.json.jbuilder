json.success @success

if !@success
  json.errors @errors
else
  json.place do
    json.id @place.id
    json.name @place.name
  end
end