class Ride < ActiveRecord::Base
  belongs_to :driver
  belongs_to :passenger

  def print_details
    puts "#{driver.first_name} #{driver.last_name} drove #{passenger.first_name} #{passenger.last_name} for #{price} from #{pick_up} to #{drop_off}"
  end
end