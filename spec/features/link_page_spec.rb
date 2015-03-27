require 'spec_helper'

describe "Links pages" do
  before do 
    @link1 = FactoryGirl.create :link
    @link2 = FactoryGirl.create :link
  	@link3 = FactoryGirl.create :link
  	visit link_path @link3
  end

  it 'view news info' do
  	expect(page).to have_title(@link3.title)
  	expect(page).to have_css("h1", text: @link3.title)
  end

  it 'view link in left bar' do
  	expect(page).to have_css("a", text: @link1.title)
    expect(page).to have_css("a", text: @link2.title)
    expect(page).to have_css("a", text: @link3.title)
  end
end