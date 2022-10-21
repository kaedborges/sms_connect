json.data do
  json.manager do
    json.id @user.id
    json.name @user.name
    json.email @user.email
    json.email @user.cellphone
  end
end