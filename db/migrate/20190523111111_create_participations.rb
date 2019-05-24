class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :player, foreign_key: true
      t.references :game, foreign_key: true
      t.boolean :codemaster
      t.string :team
      t.datetime :finished

      t.timestamps
    end
  end
end
