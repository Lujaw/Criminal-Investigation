class Criminal < ActiveRecord::Base
  include HTTMultiParty

  has_many :results, :dependent => :destroy

  attr_accessible :name, :photo
  mount_uploader :photo, PhotoUploader


  def send_to_cf
    response = Criminal.post('http://api.imgur.com/2/upload', :query => { :key => '3d261fa489c860fcecfa26ae37911f8d', :image => File.new("#{Rails.root}/public#{self.photo}") })
    # run = CF::Run.find("presha-2012jan04-121635")
    #         units = CF::Run.add_units({:run_title => "presha-2012jan04-121635", :units => [{"image_url" => @criminal.photo, :meta_data => @criminal.id}]})
    run = CF::Run.create("lujaw/criminaldb-4", "test#{self.id}", [{"image_url" => response["upload"]["links"]["original"], :meta_data => self.id}])
    #    units = CF::Run.add_units({:run_title => "criminaldb", :units => [{"image_url" => @criminal.photo, :meta_data => @criminal.id}]})
    end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
