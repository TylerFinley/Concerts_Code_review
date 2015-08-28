
require('spec_helper')

describe(Band) do
    it('return the bands name') do
      band = Band.create({band: 'gang of four'})
      expect(band.band).to(eq('Gang of four'))


  end
end
