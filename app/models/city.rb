class City < ApplicationRecord
    belongs_to :country
    has_many :destinations
    has_many :users, through: :destinations
    validates :name, presence: true, uniqueness: true
    validates :country_id, presence: true
    scope :most_visited, -> { joins(:destinations).group('destinations.city_id').order("count(destinations.city_id) desc").limit(1)}
    scope :highly_rated, -> { joins(:destinations).merge(Destination.group(:city_id).having('AVG(rating) >= 4.5'))}

  def city_plus_country
    "#{self.name}, #{country.name}"
  end

  def avg_rating
    if self.trips.count == 0
      "This city hasn't been rated yet."
    else
      self.trips.average(:rating).to_f.round(1)
    end
  end

  def country_name=(country_name)
    if country_name[:country] != ""
      country = Country.find_or_create_by(name: country_name[:country])
     self.country_id = country.id
    end
   end
end
