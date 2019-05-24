class Word < ApplicationRecord
  has_many :game_words
  has_many :games, through: :game_words

  def self.random(n = 1, min_len = 0, max_len = 99)
    words = []

    n.times do
      words << self.all.sample.word
    end

    filtered = words.select do |w|
      w.size >= min_len && w.size <= max_len
    end

    words.size > 1 ? words : words[0]
  end
end