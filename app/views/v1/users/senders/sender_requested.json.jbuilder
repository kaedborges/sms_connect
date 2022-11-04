json.data do
  json.sender_requested do
    json.id @requested.id
    json.sender @requested.name
    json.status @requested.status
  end
end
