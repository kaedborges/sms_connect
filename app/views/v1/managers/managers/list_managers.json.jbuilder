json.data do
  json.managers @managers do |manager|
    json.id manager.id
    json.name manager.nome
    json.email manager.email
  end
end