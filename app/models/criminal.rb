class Criminal < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :name

    def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
   end
end
