require 'spec_helper'

describe "PageSpec" do
  let(:page1){ FactoryGirl.create :page}
  let(:page2) {FactoryGirl.create :page}
  before { visit page_path page1}

  it 'view page info' do
  	expect(page).to have_title page1.title
  	expect(page).to have_content page1.content
    expect(page).to have_content page1.title
  end

  it 'have link in home page' do
    visit page_path page2
    expect(page).to have_css("a", :text => page1.title)
    expect(page).to have_css("a", text: page2.title)
  end
end