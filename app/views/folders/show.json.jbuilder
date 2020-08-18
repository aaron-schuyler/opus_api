json.name @folder.name
json.id @folder.id
json.color @folder.color
json.docs @folder.docs do |doc|
  json.name doc.name
  json.id doc.id
  json.body doc.body
  json.shared doc.shared
end
