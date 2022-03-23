class Game < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :category
    
    def self.find_by_platform(platform)
        self.all.pluck(:game)
    end
    
    def average_rating
        # binding.pry
        rate = self.reviews.average(:rating)
        rate ? rate : "No ratings yet"
    end

end