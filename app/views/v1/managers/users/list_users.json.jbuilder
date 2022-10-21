json.data do
  json.users @users do |user|
    json.id user.id
    json.name user.name
    json.email user.email
    json.cellphone user.cellphone
    json.status user.status
  end
end