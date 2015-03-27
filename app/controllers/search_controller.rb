class SearchController < ApplicationController
  def index
  	if session[:sort_goods] == 'price' || session[:sort_goods] == 'name'
  	  @goods = Good.where('(name LIKE ? OR articul LIKE ?) AND visible = ?', "%#{params[:search]}%", "%#{params[:search]}%", true).paginate(:page => params[:page]).order(session[:sort_goods])
    else
      @goods = Good.where('(name LIKE ? OR articul LIKE ?) AND visible = ?', "%#{params[:search]}%", "%#{params[:search]}%", true).paginate(:page => params[:page]).order(views: :desc)
    end
  end
end
