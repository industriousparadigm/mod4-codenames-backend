class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :winner_color
      t.string :key

      t.timestamps
    end
  end
end
