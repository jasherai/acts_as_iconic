create_table "icons", :force => true do |t|
  t.string  "name",         :null => false
  t.integer "parent_id"
  t.string  "content_type"
  t.string  "filename"
  t.string  "thumbnail"
  t.integer "size"
  t.integer "width"
  t.integer "height"
end

create_table "mime_types", :force => true do |t|
  t.string  "ext"
  t.string  "content_type"
  t.integer "icon_id",      :null => false
end