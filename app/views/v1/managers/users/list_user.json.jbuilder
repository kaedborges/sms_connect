json.data do
  json.user do
    json.id @user.id
    json.name @user.name
    json.email @user.email
    json.cellphone @user.cellphone
    json.status @user.status
  end
end