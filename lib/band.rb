class Band < ActiveRecord::Base
  has_and_belongs_to_many(:concerts)
  validates(:band, :presence => true)



private

    define_method(:capitalize_band) do
      band = self.band().split()
      band.each() do |word|
        word.capitalize!()
      end
      self.band = band.join(" ")
    end

  end
