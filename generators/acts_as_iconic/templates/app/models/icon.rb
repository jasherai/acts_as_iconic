class Icon < ActiveRecord::Base
  has_many :mime_types
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :resize_to => '16x16',
                 :processor => :Rmagick,
                 :size => 0..1.megabytes,
                 :path_prefix => "public/images/acts_as_iconic"
  validates_as_attachment
end
