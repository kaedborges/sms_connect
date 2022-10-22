json.data do
  json.credit @credits do |credit|
    json.balance credit.balace
    json.operation credit.operation
  end
end