require('spec_helper')
require 'band'

describe(Concert) do
  it('return the name of the concert') do
    concert = Concert.create({concert: 'Parrot concert'})
    expect(concert.concert).to(eq('Parrot dragon stage'))
  end
end
