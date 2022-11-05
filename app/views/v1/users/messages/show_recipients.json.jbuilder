json.data do
    json.recipients @message.recipients do |r|
      json.cellphone r.phone
      json.status r.status
    end
end