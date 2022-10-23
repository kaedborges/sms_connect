json.data do
  json.credit_transfers @credits do |credit|
    json.balance credit.balance
    json.operation credit.operation
    json.data_tranfer credit.created_at
  end
end