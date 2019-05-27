class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations
  has_many :tiles
  has_many :words, through: :tiles

  def self.generate_key
    key = [
      'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 
      'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 
      'y', 'y', 'y', 'y', 'y', 'y', 'y',
      'a'
    ]
    rand < 0.5 ? key << 'b' : key << 'r'
    key.shuffle.join
  end

  def populate_tiles
    words = Word.random(25, 4, 10)
    key = Game.generate_key
    words.each.with_index do |w, i|
      self.words << Word.find_by(word: w)
      tile = self.tiles[i]
      case key[i]
      when 'r'
        tile.color = "red"
      when 'b'
        tile.color = "blue"
      when 'y'
        tile.color = "yellow"
      when 'a'
        tile.color = "assassin"
      end
      tile.save
    end
  end

  # def going_first
  #   key.count('b') > key.count('r') ? 'blue' : 'red'
  # end

end
