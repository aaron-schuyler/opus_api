json.folders @folders do |folder|
  json.(folder, :id, :name, :color)
  json.docs folder.docs.count
end
