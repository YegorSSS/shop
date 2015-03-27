require 'spec_helper'

describe "News pages" do
  before do 
  	@news1 = FactoryGirl.create :news
  	@news2 = FactoryGirl.create :news
  	@news3 = FactoryGirl.create :news
  	visit news_path @news3
  end

  it 'view news info' do
  	expect(page).to have_title(@news3.title)
  	expect(page).to have_css("h1", text: @news3.title)
  end

  it 'view last 2 news in left block' do
  	expect(page).to have_css("a", text: @news2.title)
  	expect(page).to have_css("a", text: @news3.title)
  	expect(page).not_to have_css("a", text: @news1.title)
  end

  it 'view news list' do
  	visit '/news'
  	expect(page).to have_content @news1.title
  	expect(page).to have_content @news2.title
  	expect(page).to have_content @news1.title
  	expect(page).to have_content @news1.anons
  	expect(page).to have_content @news2.anons
  	expect(page).to have_content @news3.anons
  	expect(page).to have_content @news1.created_at.strftime('%F')
  	expect(page).to have_content @news2.created_at.strftime('%F')
  	expect(page).to have_content @news3.created_at.strftime('%F')
  	expect(page).to have_title 'Новости'
  end
end