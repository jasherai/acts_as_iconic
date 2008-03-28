module Bilson
  module ActsAsIconic
    def self.included(base)
      base.extend ActMethods
    end
    
    module ActMethods
      def acts_as_iconic
        unless included_modules.include? InstanceMethods
          extend ClassMethods
          include InstanceMethods
        end
      end
    end
    
    module ClassMethods
      
    end
    
    module InstanceMethods
      def icon_path
        mime_type = match_content_type_and_ext(self.content_type)
        # search for at least content type match if not content type & extension
        mime_type ||= match_content_type(self.content_type)
        mime_type ? get_icon_from_mime(mime_type) : unknown_icon
      end

      # some files will have the same content type 
      # (i.e. psd and exe have "application/octet-stream")
      # check to see if there is also a file extension match
      # by parsing the extension from the filename
      # still require that the content type is a match
      def match_content_type_and_ext(content_type)
        chars = self.filename.reverse.index('.') + 1
        ext = self.filename[-chars,chars]
        mime_from_ext = MimeType.find(:first, :conditions => ["content_type = ? AND ext = ?", content_type, ext])  
      end

      # find mime_type in mime_types table from content_type in attachment  
      def match_content_type(content_type)
        MimeType.find_by_content_type(content_type)
      end

      # generic icon
      def unknown_icon
        match_content_type('unknown_icon').icon.public_filename
      end

      # check if mime_type has an associated icon and return OR return generic icon
      def get_icon_from_mime(mime_type)
        mime_type.icon ? mime_type.icon.public_filename : unknown_icon
      end
      
    end
  end
end
