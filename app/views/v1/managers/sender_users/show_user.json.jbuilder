json.data do
  json.user @user.name
  json.senders @user.sender_users do |userSender|
    json.id userSender.sender.id
    json.name userSender.sender.name
  end
end