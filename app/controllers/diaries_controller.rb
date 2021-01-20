class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :specified_diary, only: [:edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]

  def index
    @diaries = Diary.order('created_at DESC')
  end

  def show
    @diaries = current_user.diary.order('created_at DESC')
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      make_count
      redirect_to diary_path(current_user.id), notice: '日記の作成に成功しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(current_user.id), notice: '日記の編集に成功しました'
    else
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      redirect_to diary_path(current_user.id), notice: '日記の削除に成功しました'
    else
      render :show
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text).merge(user_id: current_user.id)
  end

  def specified_diary
    @diary = Diary.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless @diary.user.id == current_user.id
  end

  def make_count
    sum = current_user.diary_count.to_i + 1
    current_user.update_column(:diary_count, sum)
  end
end
