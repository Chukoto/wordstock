class DiariesController < ApplicationController
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
      redirect_to diary_path(current_user.id)
    else
      render :new
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text).merge(user_id: current_user.id)
  end
end
