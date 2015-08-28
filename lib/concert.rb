class Concert < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:concert, :presence => true)
  private

    define_method(:capitalize_concert) do
      concert = self.concert().split()
      concert.each() do |word|
        word.capitalize!()
      end
      self.concert = concert.join(" ")
    end

  end
