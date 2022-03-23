class User < ActiveRecord::Base

    def self.most_reviews
        # get an array of all users
        # sort the array by the number of reviews of each user
        # return the first user obj in the array
        self.all.max_by { |user| user.reviews.length }
    end
    
    has_many :reviews
    has_many :games, through: :reviews
    has_many :favorites
    has_many :favorite_games, through: :favorites, source: :game


    def write_review(game, content, rating)
        self.reviews.create(game: game, content: content, rating: rating)
    end

    def add_favorite(game)
        # Favorite.create(user: self, game: game)
        self.favorite_games << game
    end

end