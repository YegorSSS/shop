require 'spec_helper'

describe "SearchPage" do
  before do
  	@good1 = FactoryGirl.create :good, name: 'Casiopeya GT2028', articul: 'nf432-8675'
  	@good2 = FactoryGirl.create :good, name: 'Sony hr784', visible: false
  	visit root_path

  end

  it 'find good1' do
  	fill_in 'search', :with => 'Casio'
  	find('.serch-btn').click
  	expect(page).to have_content(@good1.name)
  	expect(page).to have_content(@good1.price)
  	fill_in 'search', :with => '8675'
  	find('.serch-btn').click
  	expect(page).to have_content(@good1.name)
  	expect(page).to have_content(@good1.price)
  end

  it 'not search good2' do
  	fill_in 'search', :with => 'Sony'
  	find('.serch-btn').click
  	expect(page).not_to have_content(@good2.name)
  	expect(page).not_to have_content(@good2.price)
  end

  it 'return blank result' do
  	fill_in 'search', :with => 'hfbfruugeygc'
  	find('.serch-btn').click
  	expect(page).to have_content('По Вашему запросу товаров не найдено')
  end
end