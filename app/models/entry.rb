class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :foods, through: :entry_foods
  has_many :entry_foods, dependent: :destroy
end
