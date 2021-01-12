class ContentsController < ApplicationController
  before_action :specified_content, only: [:show, :edit, :update]

  def index
    @contents = Content.all
    @content_post_ranking = User.order('content_count desc').limit(3)
    @description_post_ranking = User.order('description_count desc').limit(3)
    @sentence_post_ranking = User.order('sentence_count desc').limit(3)
    @diary_post_ranking = User.order('diary_count desc').limit(3)
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      make_new_history
      make_count
      redirect_to content_path(@content.id), notice: "単語の追加に成功しました"
    else
      render :new
    end
  end

  def show
    @descriptions = Description.where(content_id: params[:id])
    @sentences = Sentence.where(content_id: params[:id])
  end

  def edit
  end

  def update
    if @content.update(content_params)
      make_new_history
      redirect_to content_path(@content.id), notice: "単語の更新に成功しました"
    else
      render :edit
    end
  end

  def search
    @contents = Content.search(params[:keyword])
  end

  private

  def content_params
    params.require(:content).permit(:part_id, :word).merge(user_id: current_user.id)
  end

  def specified_content
    @content = Content.find(params[:id])
  end

  def make_new_history
    new_history = @content.contents_histories.new
    new_history.user_id = current_user.id
    new_history.word = @content.word
    new_history.save
  end

  def make_count
    sum = current_user.content_count.to_i + 1
    current_user.update_column(:content_count, sum)
  end
end
