json.user do
  json.id @current_user.id
  json.name @current_user.name
  json.last_name @current_user.last_name
  json.email @current_user.email
  json.picture @current_user.picture
  json.user_type do
    json.id @current_user.user_type.id
    json.name @current_user.user_type.name
  end
end