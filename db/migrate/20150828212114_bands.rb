class Bands < ActiveRecord::Migration
  def change
    create_table(:concerts) do |t|
      t.column(:concert, :string)


      t.timestamps()
    end
  end
end
