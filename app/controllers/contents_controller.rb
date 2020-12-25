class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to contents_path
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
    @descriptions = Description.where(content_id: params[:id])
  end


  private

  def content_params
    params.require(:content).permit(:part_id, :word)
  end
end
