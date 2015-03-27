require 'spec_helper'

describe "OrderSpec" do
	let(:customer){FactoryGirl.create :customer}
  before do 
	  @good = FactoryGirl.create :good
    @good2 = FactoryGirl.create :good
    @dostavka = FactoryGirl.create :dostavka
    @payment = FactoryGirl.create :payment
    visit category_path(@good.category.id)
  end

  describe 'add good in the basket' do
    
    it 'should respond to good info' do
      find(".basket_link").click
      find('#order').click
      expect(page).to have_title('Корзина')
      expect(page).to have_content(@good.name)
      expect(page).to have_content(@good.price)
      expect(page).to have_content(@dostavka.name)
      expect(page).to have_content(@payment.name)
    end

    it 'customer is sign_in' do
      click_link('Войти')
      fill_in 'E-Mail', :with => customer.email
      fill_in 'Пароль', :with => customer.password
      click_button 'Войти'
      visit category_path(@good.category.id)

      find(".basket_link").click
      find('#order').click
      expect(page).to have_title('Корзина')
      expect(page).to have_content(@good.name)
      expect(page).to have_content(@good.price)
      expect(page).to have_content(@dostavka.name)
      expect(page).to have_content(@payment.name)
      expect(page).to have_css("input[value='#{customer.name}']")
      expect(page).to have_css("input[value='#{customer.email}']")
      expect(page).to have_css("input[value='#{customer.address}']")
      expect(page).to have_css("input[value='#{customer.tel}']")
      expect(page).to have_css("input[value='#{customer.id}']")
    end
  end

  describe 'delete goods in the basket' do
    it 'add and delete good' do
      find(".basket_link").click
      visit category_path(@good2.category_id)
      find(".basket_link").click
      find(".basket_link").click
      find('#order').click
      expect(page).to have_content(@good.name)
      expect(page).to have_content(@good2.name)
      expect(find_field("order[goodsinorders_attributes][1][quantity]").value).to eq ("2")
      find("a[href='/sessions/basket_update?good_id=#{@good2.id}']").click
      expect(page).to have_content(@good.name)
      expect(page).not_to have_content(@good2.name)
      find("a[href='/sessions/basket_update?good_id=#{@good.id}']").click
      expect(page).to have_content('Ваша корзина пуста')

    end
  end

  describe 'To order goods' do

    it 'with valid information' do
      find(".basket_link").click
      find('#order').click
      choose id = "order_dostavka_id_#{@dostavka.id}"
      choose id = "order_payment_id_#{@payment.id}"
      fill_in id="order_name", :with => 'Иванов Иван Иванович'
      fill_in id="order_mail", :with => 'example@example.com'
      fill_in id="order_tel", :with => '365-76-47'
      fill_in id="order_address", :with => 'г.Копре, ул. Вязов, 13'
      fill_in id="order_detail", :with => 'Пример: Позвоните пожалуйста после 10 вечера, до этого времени я на работе'
      click_button "Create Order"
      @order = Order.last
      expect(page).to have_content "Номер Вашего заказа - #{@order.id}"
      expect(page).to have_content 'Корзина пуста'
      expect(@order.name).to eq 'Иванов Иван Иванович'
      expect(@order.mail).to eq 'example@example.com'
      expect(@order.tel).to eq '365-76-47'
      expect(@order.address).to eq 'г.Копре, ул. Вязов, 13'
      expect(@order.detail).to eq 'Пример: Позвоните пожалуйста после 10 вечера, до этого времени я на работе'
      expect(@order.dostavka_id).to eq @dostavka.id
      expect(@order.payment_id).to eq @payment.id
    end

    it 'with valid information and sign in customer' do
      click_link('Войти')
      fill_in 'E-Mail', :with => customer.email
      fill_in 'Пароль', :with => customer.password
      click_button 'Войти'
      visit category_path(@good.category.id)

      find(".basket_link").click
      find('#order').click
      click_button "Create Order"

      @order = Order.last
      expect(page).to have_content "Номер Вашего заказа - #{@order.id}"
      expect(page).to have_content 'Корзина пуста'
      expect(@order.name).to eq customer.name
      expect(@order.mail).to eq customer.email
      expect(@order.tel).to eq customer.tel
      expect(@order.address).to eq customer.address
      expect(@order.detail.inspect).to eq "\"\\n\""
      expect(@order.dostavka_id).to eq nil
      expect(@order.payment_id).to eq nil
      expect(@order.customer_id).to eq customer.id
    end

    it 'with invalid information' do
      find(".basket_link").click
      find('#order').click
      click_button "Create Order"

      expect(page).to have_content("Mail can't be blank")
      expect(page).to have_content("Mail is invalid")
    end
  end
end