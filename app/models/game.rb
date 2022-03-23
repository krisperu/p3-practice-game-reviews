class Game < ActiveRecord::Base

    def self.find_by_platform(platform)
        # self.all.find_by(platform: platform) # won't work b/c only returns first instance found
        self.all.where(platform: platform)
    end

    def self.most_popular
        self.all.max_by{|game| game.favorites.length }
    end
    
    
    has_many :reviews
    has_many :users, through: :reviews
    has_many :game_categories
    has_many :categories, through: :game_categories
    has_many :favorites
    has_many :favoriters, through: :favorites, source: :user


    def average_rating
        # get [] of game's reviews or nil
        # use ternary to return either average of review ratings or "no ratings"
        self.reviews.length > 0 ? self.reviews.average(:rating).to_f : "No ratings yet."
    end

    def add_category(category)
        self.categories << category
    end


end