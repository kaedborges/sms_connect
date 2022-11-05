json.data do
  json.message do
    json.id @message.id
    json.sender @sender.name
    json.text @message.text
    json.parts @message.parts
    json.size @message.size
  end
end