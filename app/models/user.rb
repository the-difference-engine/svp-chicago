class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lois
  has_many :ratings
  has_many :rfps
  has_many :rfp_ratings

  def number_of_invites
    ratings.where(q5: "Yes").count
  end

  def active_for_authentication?
    super && active_account?
  end

end