class Criminal < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
end
