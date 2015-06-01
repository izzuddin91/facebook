class User < ActiveRecord::Base
   validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :profiles
  has_many :statuses, through: :profiles

def self.authenticate(email, password)

    @user = User.where(email: email, password: password).first
    # if email and password correspond to a valid user, return that user
    if @user.present?
      @user
    # otherwise, return nil
    else
      nil
    end
  end


end
