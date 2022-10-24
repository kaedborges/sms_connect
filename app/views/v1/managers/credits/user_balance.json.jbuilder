json.data do
  json.user do
    json.id @user.id
    json.name @user.name
  end
  json.credit @user_balace.balace
end