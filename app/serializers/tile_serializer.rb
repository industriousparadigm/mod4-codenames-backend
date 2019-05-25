class TileSerializer < ActiveModel::Serializer
  attributes :word, :color

  def word
    object.word.word
  end
  
end
