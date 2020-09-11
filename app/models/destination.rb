class Destination < ApplicationRecord
    belongs_to :user
    belongs_to :city
    validates :city, presence: true
    validates_uniqueness_of :city_id, :scope => :user_id, message: "already added to your trips!"
    validates :rating, presence: true 
    validates_numericality_of :rating, :only_integer => true, message: "must be a whole number"
    validates_inclusion_of :rating, :in => 1..5, message: "must be between 1 and 5"
    validates :fave_attraction, presence: true 
    validates :comment, presence: true
    scope :five_star, -> { where(rating: 5) }

    
end
