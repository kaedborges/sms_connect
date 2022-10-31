json.data do
  json.user @user.name
  json.senders @userSender do |userSender|
    json.id userSender.sender.id
    json.name userSender.sender.name
  end
end