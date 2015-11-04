class User < ActiveRecord::Base
  has_secure_password
  has_many :users_foods
  has_many :foods, through: :users_foods
end
