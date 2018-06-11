json.success true
json.news @news do |n|
  json.id n.id
  json.title n.title
  json.body n.body
end