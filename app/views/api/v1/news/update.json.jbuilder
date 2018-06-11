json.success @success

if !@success
  json.errors @errors
else
  json.news do
    json.id @news.id
    json.title @news.title
    json.body @news.body
  end
end