class Country < ApplicationRecord
  has_many :cities
  has_many :destinations, through: :cities
      
    def random_attraction
      attractions = []
      self.destinations.each do |destination|
        attractions << destination.fave_attraction
      end
          
      if attractions.empty?
        random = "No favorite attractions added for #{self.name} yet."
      else
        random = attractions.sample
      end
      random
    end
end
