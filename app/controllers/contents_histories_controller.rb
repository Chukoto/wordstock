class ContentsHistoriesController < ApplicationController

  def show
    @contents_history = ContentsHistory.find(params[:id])
    @content_word = @contents_history.content.word
    @contents_histories = ContentsHistory.where(content_id: params[:content_id]).order('created_at DESC')
  end
end
