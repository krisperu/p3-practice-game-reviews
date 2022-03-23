class Category < ActiveRecord::Base

    def self.most_popular
        Game.most_popular.categories
    end

    def self.highest_rated
        # may need updating for advanced deliverables: allow [] as return value
        Review.all.max_by(&:rating).game.categories
    end

    has_many :game_categories
    has_many :games, through: :game_categories

    def platforms
        self.games.pluck(:platform).uniq
    end
    
end