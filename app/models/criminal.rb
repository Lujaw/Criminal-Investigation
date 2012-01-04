class Criminal < ActiveRecord::Base
   attr_accessible :name, :photo
  mount_uploader :photo, PhotoUploader

    def self.search(search)
              if search
                where('name LIKE ?', "%#{search}%")
              else
                scoped
              end
           end
end
