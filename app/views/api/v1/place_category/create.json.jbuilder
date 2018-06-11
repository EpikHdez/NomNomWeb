json.success @success

if !@success
  json.errors @errors
else
  json.place_category @place_category
end
