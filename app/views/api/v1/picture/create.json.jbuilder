json.success @success

if !@success
  json.errors @errors
else
  json.picture @picture
end
