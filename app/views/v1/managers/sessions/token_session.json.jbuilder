json.data do
  json.token @token
  json.exp @time.strftime("%m-%d-%Y %H:%M")
end