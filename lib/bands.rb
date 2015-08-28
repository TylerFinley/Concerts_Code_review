class Band < ActiveRecord::Base
  belongs_to(:venue)
  validates(:name, :presence => true)
end
