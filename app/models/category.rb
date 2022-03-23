class Category < ActiveRecord::Base
    has_many :games

    def self.highest_rated
        self.all.max_by { |r| r.reviews.rating }
    end

    def platforms 
        self.games.pluck(:platform).uniq
    end

end