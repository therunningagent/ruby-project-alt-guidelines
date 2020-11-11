class Character < ActiveRecord::Base
    has_many :games
    has_many :users, through: :games

    puts "hello world"

end 