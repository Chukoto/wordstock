class SentencesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :specified_sentence, only: [:edit, :update]
  before_action :specified_user, only: [:edit]
 
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sentence.update(sentence_params)
      redirect_to root_path
    else
      render :edit
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
end
