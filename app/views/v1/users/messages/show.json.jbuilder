json.data do
  json.messages do
    json.id @message.id
    json.sender @message.sender.name
    json.text @message.text
    json.parts @message.parts
    json.size @message.size
    json.recipients @message.recipients do |r|
      json.cellphone r.phone
      json.status r.status
    end
  end
end