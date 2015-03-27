require 'spec_helper'

describe "TopPages" do

  it 'new Good has title, img, price' do
  	visit '/top?view=fresh'
  	expect(page).to have_content('Товаров пока нет')
  	FactoryGirl.create(:good, name: 'good 543', img: "phone-index.jpg", price: 985, fresh: true)
	visit '/top?view=fresh'
  	expect(page).to have_content('good 543')
  	expect(page).to have_content('985')
  	expect(page).to have_css("img[src*='assets/phone-index.jpg']")
  end

  it 'sale Good has title, img, price' do
    visit '/top?view=sale'
    expect(page).to have_content('Товаров пока нет')
    FactoryGirl.create(:good, name: 'good sale', img: "phone-index.jpg", price: 1000, sale: true)
  visit '/top?view=sale'
    expect(page).to have_content('good sale')
    expect(page).to have_content('1000')
    expect(page).to have_css("img[src*='assets/phone-index.jpg']")
  end

  it 'hits Good has title, img, price' do
    visit '/top?view=hits'
    expect(page).to have_content('Товаров пока нет')
    FactoryGirl.create(:good, name: 'goodhit', img: "phone-index.jpg", price: 432, hits: true)
  visit '/top?view=hits'
    expect(page).to have_content('goodhit')
    expect(page).to have_content('432')
    expect(page).to have_css("img[src*='assets/phone-index.jpg']")
  end

  it 'has top`s img' do
    good = FactoryGirl.create :good, sale: true, hits: true, fresh: true
    visit '/top?view=hits'
    expect(page).to have_css("img[src*='/assets/ico-det-new.jpg']")
    expect(page).to have_css("img[src*='/assets/ico-det-lider.jpg']")
    expect(page).to have_css("img[src*='/assets/ico-det-sale.jpg']")
    Good.all.each {|g| g.update_attributes sale: false, hits: false, fresh: false}
    visit '/top?view=hits'
    expect(page).to have_content('Товаров пока нет')
  end

  it 'show count good in basket' do
    FactoryGirl.create :good, fresh: true, price: 50
    visit '/top?view=fresh'
    expect(page).to have_content('Корзина пуста')
      first('.basket_link').click
    expect(page).not_to have_content('Корзина пуста')
    expect(page).to have_content('Товаров в корзине: 1')
    expect(page).to have_content('на сумму: 50 грн.')
  end

  it 'didn`t has good with presence == false' do
    good = FactoryGirl.create :good, presence: false, fresh: true
    visit '/top?view=fresh'
    expect(page).not_to have_content(good.name)
  end

  it 'not to have good if visible == false' do
    good = FactoryGirl.create :good, visible: false, fresh: true
    visit '/top?view=fresh'
    expect(page).not_to have_content(good.name)
  end
end