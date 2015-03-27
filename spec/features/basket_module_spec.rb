require 'spec_helper'

describe "BasketSpec" do
  let(:good1){FactoryGirl.create :good}
  let(:good2){FactoryGirl.create :good}
  before { visit category_path(good1.category_id) }

  describe 'add goods in basket' do
  	
  	it 'add good1 in basket' do
  	  find(".basket_link").click
  	  expect(page).to have_content('Товаров в корзине: 1')
  	  expect(page).to have_content("на сумму: #{good1.price} грн.")
  	end

  	it 'add 2 good2 in basket' do
  	  find(".basket_link").click
  	  expect(page).to have_content('Товаров в корзине: 1')
  	  expect(page).to have_content("на сумму: #{good1.price} грн.")
  	  visit category_path(good2.category_id)
  	  find(".basket_link").click
  	  expect(page).to have_content('Товаров в корзине: 2')
  	  expect(page).to have_content("на сумму: #{good1.price + good2.price} грн.")
  	  find(".basket_link").click
  	  expect(page).to have_content('Товаров в корзине: 3')
  	  expect(page).to have_content("на сумму: #{good1.price + good2.price + good2.price} грн.")
  	end
  end
end