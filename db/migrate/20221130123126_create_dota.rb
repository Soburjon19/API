class CreateDota < ActiveRecord::Migration[7.0]
  def change
    create_table :dota do |t|
      t.string :hero
      t.string :item
      t.string :team
      t.string :player

      t.timestamps
    end
  end
end
