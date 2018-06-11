json.success true
json.products @products do |product|
  json.id product.id
  json.name product.name
  json.descripton product.description
  json.price product.price
  json.picture product.picture
end