class ActsAsIconicGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'app/models/icon.rb', 'app/models/icon.rb'
      m.file 'app/controllers/icons_controller.rb', 'app/controllers/icons_controller.rb'
      m.directory 'app/views/icons'
      m.file 'app/views/icons/index.haml', 'app/views/icons/index.haml'
      m.file 'app/views/icons/edit.haml', 'app/views/icons/edit.haml'
      m.file 'app/views/icons/show.haml', 'app/views/icons/show.haml'
      m.file 'app/views/icons/new.haml', 'app/views/icons/new.haml'
      m.directory 'app/views/mime_types'
      m.file 'app/models/mime_type.rb', 'app/models/mime_type.rb'
      m.file 'app/controllers/mime_types_controller.rb', 'app/controllers/mime_types_controller.rb'
      m.file 'app/views/mime_types/index.haml', 'app/views/mime_types/index.haml'
      m.file 'app/views/mime_types/edit.haml', 'app/views/mime_types/edit.haml'
      m.file 'app/views/mime_types/show.haml', 'app/views/mime_types/show.haml'
      m.file 'app/views/mime_types/new.haml', 'app/views/mime_types/new.haml'
      m.migration_template 'db/migrate/create_icons_and_mime_types.rb', 'db/migrate', :migration_file_name => "create_icons_and_mime_types"
      m.directory 'public/images/acts_as_iconic'
      m.file 'test/fixtures/icons.yml', 'test/fixtures/icons.yml'
      m.file 'test/fixtures/mime_types.yml', 'test/fixtures/mime_types.yml'
    end
  end
end
