class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

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

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
    
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
      end
    end
end
