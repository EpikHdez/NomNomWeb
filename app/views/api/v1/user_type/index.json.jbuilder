json.success true
json.user_types @user_types do |user_type|
  json.id user_type.id
  json.name user_type.name
end