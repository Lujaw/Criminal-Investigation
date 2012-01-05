class Result < ActiveRecord::Base
  belongs_to :criminal

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
