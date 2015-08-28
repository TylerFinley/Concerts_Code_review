class Concerts < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:band, :string)


      t.timestamps()
    end
  end
end
