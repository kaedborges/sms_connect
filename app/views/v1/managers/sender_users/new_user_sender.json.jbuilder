json.data do
  json.user do
    json.id @userSender.user.id
    json.name @userSender.user.name
  end
  json.sender @userSender.sender.name
end