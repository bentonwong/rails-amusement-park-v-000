class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, :password_digest, presence: true #:happiness, :nausea, :height, :tickets,

  def mood
    if self.nausea >= self.happiness
      'sad'
    else
      'happy'
    end
  end

end
