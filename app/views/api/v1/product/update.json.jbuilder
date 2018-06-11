json.success @success

if !@success
  json.errors @errors
else
  json.product @product
end