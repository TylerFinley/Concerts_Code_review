class venue < ActiveRecord::Base
  has_many(:bands)
  validates(:name, :presence => true)
end
