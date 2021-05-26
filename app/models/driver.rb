class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides

    def accept_ride_request(passenger, price, pick_up, drop_off)
        Ride.create(driver_id: id,
                    passenger_id: passenger.id,
                    pick_up: pick_up,
                    drop_off: drop_off,
                    price: price)
    end

    def total_income
        rides.sum {|ride_instance| ride_instance.price}
    end

    def cancel_ride(passenger)
        found_ride = Ride.find_by(passenger_id: passenger.id)
        if found_ride
            found_ride.destroy
        end
    end

    def self.most_active_driver
        all.max_by {|driver| driver.rides.length}
    end

    def self.best_performing_driver
        all.max_by {|driver| Float(driver.rating)}
    end
end