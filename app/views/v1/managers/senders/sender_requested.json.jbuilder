json.data do
  json.sender_requested @senderRequested do |sender|
    json.sender sender.name
    json.status sender.status
  end
end