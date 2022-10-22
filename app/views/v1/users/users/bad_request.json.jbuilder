json.data do
  json.user do
    json.code 400
    json.status 'Bad request'
    json.message @user.errors.messages
  end
end