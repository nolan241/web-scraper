class Movie < ApplicationRecord
    #associate movies to a user
    belongs_to :user
end
