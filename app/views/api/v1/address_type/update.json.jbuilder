json.success @success

if !@success
  json.errors @errors
else
  json.address_type @address_type
end