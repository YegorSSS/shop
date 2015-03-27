require 'spec_helper'

describe "CategoryPages" do

  before do 
  	@good = FactoryGirl.create :good
    @good2 = FactoryGirl.create :good, visible: false
    visit category_path(@good.category.id)
  end
  
  it "has the goods name, img, price" do
    expect(page).to have_content(@good.name)
    expect(page).to have_css("img[src*='/assets/#{@good.img}']")
    expect(page).to have_content(@good.price)
  end

  it "has the categories title, keyword, description, content" do
  	expect(page).to have_title(@good.category.title)
  	expect(page).to have_content(@good.category.title)
  	expect(page).to have_content(@good.category.content)
  end

  it 'if category does not have goods' do
    Good.delete_all(category_id: @good.category.id)
    visit category_path(@good.category.id)
    expect(page).to have_content('В даной категории нет товаров')
  end

  it 'parents category have children`s good' do
    parent_cat = FactoryGirl.create :category
    children_cat = FactoryGirl.create :category, parent_id: parent_cat.id
    good = FactoryGirl.create :good, category_id: children_cat.id
    visit category_path(parent_cat.id)

    expect(page).to have_content(good.name)
  end

  it 'has top`s img' do
    good = FactoryGirl.create :good, sale: true, hits: true, fresh: true
    visit category_path(good.category.id)
    expect(page).to have_css("img[src*='/assets/ico-cat-new.png']")
    expect(page).to have_css("img[src*='/assets/ico-cat-lider.png']")
    expect(page).to have_css("img[src*='/assets/ico-cat-sale.png']")
    Good.all.each {|g| g.update_attributes sale: false, hits: false, fresh: false}
    visit category_path(good.category.id)
    expect(page).not_to have_css("img[src*='/assets/ico-cat-new.png']")
    expect(page).not_to have_css("img[src*='/assets/ico-cat-lider.png']")
    expect(page).not_to have_css("img[src*='/assets/ico-cat-sale.png']")
  end

  it 'view grid or list' do
    expect(page).not_to have_content(@good.content)
      find('#line').click
    expect(page).to have_content(@good.content)
      find('#table').click
    expect(page).not_to have_content(@good.content)
  end

  it 'show count good in basket' do
    expect(page).to have_content('Корзина пуста')
      find('.basket_link').click
    expect(page).not_to have_content('Корзина пуста')
    expect(page).to have_content('Товаров в корзине: 1')
      find('#line').click
      find('.basket_link').click
    expect(page).to have_content('Товаров в корзине: 2')
  end

  it 'show good without price' do
    @good = FactoryGirl.create :good, presence: false
    visit category_path(@good.category.id)
    expect(page).to have_content('Нет в наличии')
  end

  it 'not to show good where visible == false' do
    expect(page).not_to have_content @good2.name
  end
end
