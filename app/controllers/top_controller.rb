class TopController < ApplicationController
  def index
  	param = params[:view]
  	@goods = Good.where("#{param} = ? AND presence = ? AND visible = ?", true, true, true).paginate(:page => params[:page])

  	@title = case
  	          when params[:view] == 'fresh'
  		          'Новинки'
  		        when params[:view] == 'sale'
  		        	'Распродажа'
  		        else
  		        	'Популярные товары'
  		    end
  end
end
