class Location < ActiveRecord::Base
  validates :street_adress, presence: true
  validates :city, presence: true
  validates :state, presence: true, :length => { minimum: 2, maximum: 2 }
  validates :zip, presence: true, :length => { minimum: 5, maximum: 10 }

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{self.street_adress}, #{self.city}, #{self.state}, #{self.zip}"
  end
end
