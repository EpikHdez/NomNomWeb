json.success true
json.address_types @address_types do |address_type|
  json.id address_type.id
  json.name address_type.name
end