class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  validates :user_id, :attraction_id, presence: :true

  def take_ride
    if (attraction_tix_req > user_tix) && (attraction_height_req > user_height)
      "Sorry. You do not have enough tickets to ride the #{attraction_name}. You are not tall enough to ride the #{attraction_name}."
    elsif attraction_tix_req > user_tix
      "Sorry. You do not have enough tickets to ride the #{attraction_name}."
    elsif attraction_height_req > user_height
      "Sorry. You are not tall enough to ride the #{attraction_name}."
    else
      update_rider
    end
  end

  def find_attraction
    Attraction.find_by(id: self.attraction_id)
  end

  def attraction_tix_req
    find_attraction.tickets
  end

  def attraction_height_req
    find_attraction.min_height
  end

  def attraction_name
    find_attraction.name
  end

  def find_user
    User.find_by(id: self.user_id)
  end

  def user_tix
    find_user.tickets
  end

  def user_height
    find_user.height
  end

  def update_rider
    rider = find_user
    rider.happiness += find_attraction.happiness_rating
    rider.nausea += find_attraction.nausea_rating
    rider.tickets -= find_attraction.tickets
    rider.save
  end

end
