json.name @folder.name
json.id @folder.id
json.color @folder.color
json.docs @folder.docs do |doc|
  json.name doc.name
  json.id doc.id
  json.exerp ActionView::Base.full_sanitizer.sanitize(doc.body)[0...200]
  json.shared doc.shared
end
