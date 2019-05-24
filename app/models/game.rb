class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations
  has_many :game_words
  has_many :words, through: :game_words

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

  def going_first(key)
    key.count('b') > key.count('r') ? 'blue' : 'red'
  end

end
