class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations
end
