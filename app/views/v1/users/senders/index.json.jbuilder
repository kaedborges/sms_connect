json.data do
  json.senders @current_user.sender_users do |user|
    json.id user.sender.id
    json.name user.sender.name
  end
  json.requested @current_user.sender_requests do |sender|
    json.id sender.id
    json.name sender.name
    json.status sender.status
  end
end