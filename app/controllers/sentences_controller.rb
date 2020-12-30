class SentencesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :specified_sentence, only: [:edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]
 
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if having_word? && @sentence.save
      redirect_to content_path(@sentence.content_id), notice: "例文の追加に成功しました"
    elsif !@sentence.save || !having_word? || !@sentence.save && !having_word?
      flash.now[:alert] = "！必ず英語のテキストに#{@sentence.content.word}を含めてください！"
      render :new
    end
  end

  def edit
  end

  def update
    if having_word? && @sentence.update(sentence_params)
      redirect_to content_path(@sentence.content_id), notice: "例文の編集に成功しました"
    elsif !@sentence.update(sentence_params) || !having_word? || !@sentence.update(sentence_params) && !having_word?
      flash.now[:alert] = "！英語のテキストに#{@sentence.content.word}を含めてください！"
      render :edit
      return
    end
  end

  def destroy
    if @sentence.destroy
      redirect_to content_path(@sentence.content_id), notice: "例文の削除に成功しました"
    else
      render :show
    end
  end

  private

  def sentence_params
    params.require(:sentence).permit(:english_text, :japanese_text).merge(content_id: params[:content_id], user_id: current_user.id)
  end

  def specified_sentence
    @sentence = Sentence.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless @sentence.user.id == current_user.id
  end

  def having_word?
    @sentence.english_text.include?(@sentence.content.word)
  end
end
