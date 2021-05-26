require 'pry'
class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides

    def car_list
        rides.map {|ride| ride.driver.car}.uniq
    end

    def self.average_rating
        array_of_ratings = all.map {|passenger| Float(passenger.rating)}
        array_of_ratings.sum / array_of_ratings.size
    end

    def self.worst_rated
        all.min_by {|passenger| Float(passenger.rating)}
    end

    def self.worst_rating_in_existence
        Float(self.worst_rated.rating)
    end
end