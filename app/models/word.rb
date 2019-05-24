class Word < ApplicationRecord
  has_many :game_words
  has_many :games, through: :game_words

  def self.random(n = 1, min_len = 0, max_len = 99)

    filtered = self.all.map(&:word).select do |w|
      w.size >= min_len && w.size <= max_len
    end

    return "not enough words to match the request" if filtered.size < n

    return filtered.sample if n == 1

    words = filtered.shuffle[0 .. n - 1]

  end
end