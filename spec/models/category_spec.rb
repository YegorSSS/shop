require 'spec_helper'

describe Category do
  let(:category){FactoryGirl.create :category}
  
  subject {category}

  it { should respond_to(:title) }
  it { should respond_to(:keyword) }
  it { should respond_to(:description) }
  it { should respond_to(:content) }
  it { should respond_to(:img) }
  it { should respond_to(:parent_id) }

  it { should be_valid }

  it "is invalid without an title, keyword, description, parent_id" do
    expect(FactoryGirl.build :category, title: nil).not_to be_valid
    expect(FactoryGirl.build :category, keyword: nil).not_to be_valid
    expect(FactoryGirl.build :category, description: nil).not_to be_valid
    expect(FactoryGirl.build :category, parent_id: nil).not_to be_valid
  end

  it "has many goods" do
    expect(category).to respond_to :goods
  end

  it 'default value 0 for parent_id' do
    c = Category.create(title: 'j', keyword: 'j', description: 'h', content: 'h', img: 'r')
    expect(c.parent_id).to eq(0)
  end
end
