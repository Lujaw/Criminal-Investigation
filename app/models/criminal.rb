class Criminal < ActiveRecord::Base
  include HTTMultiParty

  # has_many :results, :dependent => :destroy
  after_create :send_to_cf
  attr_accessible :name, :photo
  validates :photo, :presence => true
  mount_uploader :photo, PhotoUploader


  def send_to_cf
    response = Criminal.post('http://api.imgur.com/2/upload', :query => { :key => '3d261fa489c860fcecfa26ae37911f8d', :image => File.new("#{Rails.root}/public#{self.photo}") })
    run = CF::Run.create("lujaw/criminaldb-4", "test#{self.id}", [{"image_url" => response["upload"]["links"]["original"], :meta_data => self.id}])
    end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
