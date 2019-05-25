class WordsController < ApplicationController

  def index
    words = Word.all

    if words.size > 0
      render json: words
    else
      render json: { error: "there are no words"}
    end
  end

  def destroy
    word = Word.find_by(id: params[:id])

    if word
      word.destroy
      render json: { success: "#{word.word} is no more" }
    else
      render json: { error: "word not found" }
    end
  end

  def manager
    render html: '<div>Hello WORLD</div>'.html_safe
  end

end
