class DescriptionsController < ApplicationController
  def new
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    if @description.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def description_params
    params.require(:description).permit(:english_text).merge(content_id: params[:content_id], user_id: current_user.id)
  end
end
