json.name @doc.name
json.id @doc.id
json.body JSON.parse(@doc.body.gsub('=>', ':')) if @doc.body
json.shared @doc.shared
json.shared_users @doc.shared_users do |user|
  json.username user.username
  json.id user.id
end
