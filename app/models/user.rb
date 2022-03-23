class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews
    
    def write_review(game, content, rating)
        self.reviews.create(game: game, content: content, rating: rating)
    end

    def self.most_reviews
        # binding.pry
        self.all.max_by {|u| u.reviews.count}
    end
end