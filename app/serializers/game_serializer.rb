class GameSerializer < ActiveModel::Serializer
  attributes :id, :tiles
  has_many :tiles

  # def first
  #   object.going_first
  # end

end
