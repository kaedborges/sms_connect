json.data do
  json.user do
    json.id @user.id
    json.name @user.name
  end
  json.credits_history @user_balaces do |credit|
    json.balance credit.balance
    json.operation credit.operation
    json.data_tranfer credit.created_at
  end
end