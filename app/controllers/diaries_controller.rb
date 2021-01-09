class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :specified_diary, only: [:edit, :update]
  before_action :specified_user, only: [:edit]

  def index
    @diaries = Diary.order("created_at DESC")
  end
  
  def show
    @diaries = current_user.diary.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      make_count
      redirect_to diary_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(current_user.id)
    else
      render :edit
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
