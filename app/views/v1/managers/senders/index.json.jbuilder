json.data do
  json.sender @senders do |sender|
    json.id sender.id
    json.name sender.name
  end
end