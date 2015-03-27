require 'spec_helper'

describe "GoodPages" do
  let(:good){FactoryGirl.create :good}
  let(:good2){FactoryGirl.create :good, presence: false}
  before {visit good_path(good.id)}

    it 'view good info' do
      expect(page).to have_content good.name
      expect(page).to have_content good.anons
      expect(page).to have_content good.content
      expect(page).to have_content good.price
      expect(page).to have_title good.name
      expect(Good.find(good.id).views).to eq 1
      visit good_path(good.id)
      expect(Good.find(good.id).views).to eq 2
    end

    it 'have not price with presence false' do
      visit good_path(good2.id)
      expect(page).to have_content 'Нет в наличии'
    end
end