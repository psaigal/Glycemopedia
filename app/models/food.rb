class Food < ActiveRecord::Base
  has_many :users_foods
  has_many :users, through: :users_foods
  belongs_to :entry
end
