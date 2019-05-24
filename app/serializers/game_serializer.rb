class GameSerializer < ActiveModel::Serializer
  attributes :id, :key, :words
  has_many :words
  class WordSerializer < ActiveModel::Serializer
    attributes :word
  end
end
