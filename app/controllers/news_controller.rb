class NewsController < ApplicationController

  def index
  @all_news = News.paginate(:page => params[:page])
  end

  def show
  	@one_news = News.find(params[:id])
  end
end