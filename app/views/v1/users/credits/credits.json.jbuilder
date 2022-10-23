json.data do
  json.credit @credits do |credit|
    json.balance credit.balace
    json.operation credit.operation
    json.data_tranfer credit.created_at
  end
end