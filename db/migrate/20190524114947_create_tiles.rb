class CreateTiles < ActiveRecord::Migration[5.1]
  def change
    create_table :tiles do |t|
      t.references :word, foreign_key: true
      t.references :game, foreign_key: true
      t.string :color
      t.integer :position
      
      t.timestamps
    end
  end
end
