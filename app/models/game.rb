class Game < ActiveRecord::Base

    def self.find_by_platform(platform)
        # self.all.find_by(platform: platform) # won't work b/c only returns first instance found
        self.all.where(platform: platform)
    end
    
    belongs_to :category
    has_many :reviews
    has_many :users, through: :reviews


    def average_rating
        # get [] of game's reviews or nil
        # use ternary to return either average of review ratings or "no ratings"
        self.reviews.length > 0 ? self.reviews.average(:rating).to_f : "No ratings yet."
    end


end