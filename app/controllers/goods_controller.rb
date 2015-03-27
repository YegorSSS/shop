class GoodsController < ApplicationController
  def index
  	@goods = Good.paginate(page: params[:page])
  end

  def show
  	@good = Good.find(params[:id])
  	@good.update_attributes(views: @good.views + 1)
  end
end