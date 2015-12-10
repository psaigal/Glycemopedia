class Food < ActiveRecord::Base
   has_many :entries, through: :entry_foods
   has_many :entry_foods
end
