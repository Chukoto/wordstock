class ContentsController < ApplicationController
  before_action :specified_content, only: [:show, :edit, :update]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      new_history = @content.contents_histories.new
      new_history.user_id = current_user.id
      new_history.save
      redirect_to contents_path, notice: "単語の追加に成功しました"
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
      new_history = @content.contents_histories.new
      new_history.user_id = current_user.id
      new_history.save
      redirect_to action: :show, notice: "単語の更新に成功しました"
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:part_id, :word).merge(user_id: current_user.id)
  end

  def specified_content
    @content = Content.find(params[:id])
  end
end
