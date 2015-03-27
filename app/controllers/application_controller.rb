class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :categories
  before_action :informers
  before_action :pages
  before_action :news

  def pages
    @all_pages = Page.all
  end

  def news
    @last_news = News.last(2)
  end
  
  def categories
    @all_categories = Category.all
  end

  def informers
  	@all_informers = Informer.order(:informer_position)
  end

end
