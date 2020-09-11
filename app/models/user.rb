class User < ApplicationRecord
    has_many :destinations
    has_many :cities, through: :destinations
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    scope :most_destinations, -> { joins(:destinations).group('destinations.user_id').order("count(destinations.user_id) desc").limit(1)}
    has_secure_password
  
    def last_destination
      self.destinations.last
    end
  
    def destination_count
      self.destinations.count
    end
end
