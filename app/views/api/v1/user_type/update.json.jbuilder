json.success @success

if !@success
  json.errors @errors
else
  json.user_type @user_type
end