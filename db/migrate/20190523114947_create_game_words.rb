class CreateGameWords < ActiveRecord::Migration[5.1]
  def change
    create_table :game_words do |t|
      t.references :word, foreign_key: true
      t.references :game, foreign_key: true
      t.string :color
      t.integer :position

      t.timestamps
    end
  end
end
