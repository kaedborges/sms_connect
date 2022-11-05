json.data do
  json.recipients(@message.recipients) { |r|
    json.cellphone r.phone
    json.status r.status
  }
end