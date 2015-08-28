class BandConcertTable < ActiveRecord::Migration
  def change
    create_table :bands_concerts do |t|
        t.column(:band_id, :int)
        t.column(:concert_id, :int)

        t.timestamps
      end
  end
end
