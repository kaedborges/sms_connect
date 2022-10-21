json.data do
  json.managers @managers do |manager|
    json.id manager.id
    json.name manager.name
    json.email manager.email
  end
end