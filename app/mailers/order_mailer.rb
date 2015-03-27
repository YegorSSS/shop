class OrderMailer < ActionMailer::Base
  default from: "yegorsss@yandex.ru"

  def order_massage(order)
  	@order = order
  	mail(to:@order.mail, subject: 'Заказ товара')
  end
end
