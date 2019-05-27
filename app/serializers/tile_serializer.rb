class TileSerializer < ActiveModel::Serializer
  attributes :id, :word, :color

  def word
    object.word.word
  end
  
end
