class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	categories_id = Category.select(:id).where("id = ? OR parent_id = ?", params[:id], params[:id])
  	if session[:sort_goods] == 'price' || session[:sort_goods] == 'name'
  	  @goods = Good.where(category_id: categories_id, visible: true).paginate(:page => params[:page]).order(session[:sort_goods])
    else
      @goods = Good.where(category_id: categories_id, visible: true).paginate(:page => params[:page]).order(views: :desc)
    end

  end
end