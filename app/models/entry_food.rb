class EntryFood < ActiveRecord::Base
  belongs_to :entry
  belongs_to :food
end
