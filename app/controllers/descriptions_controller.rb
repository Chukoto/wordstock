class DescriptionsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :specified_description, only: [:edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]

  def new
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    if @description.save
      redirect_to content_path(@description.content_id), notice: "意味の追加に成功しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @description.update(description_params)
      redirect_to content_path(@description.content_id), notice: "意味の編集に成功しました"
    else
      render :edit
    end
  end

  def destroy
    if  @description.destroy
      redirect_to content_path(@description.content_id), notice: "意味の削除に成功しました"
    else
      render :show
    end
  end

  private

  def description_params
    params.require(:description).permit(:english_text).merge(content_id: params[:content_id], user_id: current_user.id)
  end

  def specified_description
    @description = Description.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless @description.user.id == current_user.id 
  end
end
