class GameSerializer < ActiveModel::Serializer
  attributes :id, :tiles
  has_many :tiles

end
