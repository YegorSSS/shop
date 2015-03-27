require 'spec_helper'

describe Good do

  let(:good) { FactoryGirl.create :good }

  subject { good }

  it { should respond_to(:keyword) }
  it { should respond_to(:name) }
  it { should respond_to(:articul) }
  it { should respond_to(:description) }
  it { should respond_to(:anons) }
  it { should respond_to(:content) }
  it { should respond_to(:category_id) }
  it { should respond_to(:price) }
  it { should respond_to(:img) }
  it { should respond_to(:visible) }
  it { should respond_to(:sale) }
  it { should respond_to(:fresh) }
  it { should respond_to(:hits) }
  it { should respond_to(:presence) }
  it { should respond_to(:views) }

  it { should respond_to (:category)}

  it { should be_valid }

  it "is invalid without an name, keyword, description, anons, content, price, img" do
    expect(FactoryGirl.build :good, name: nil).not_to be_valid
    expect(FactoryGirl.build :good, keyword: nil).not_to be_valid
    expect(FactoryGirl.build :good, description: nil).not_to be_valid
    expect(FactoryGirl.build :good, anons: nil).not_to be_valid
    expect(FactoryGirl.build :good, content: nil).not_to be_valid
    expect(FactoryGirl.build :good, price: nil).not_to be_valid
    expect(FactoryGirl.build :good, img: nil).not_to be_valid
  end

  it "does not allow duplicate names, articuls" do
    expect(FactoryGirl.build :good, name: good.name).not_to be_valid
    expect(FactoryGirl.build :good, articul: good.articul).not_to be_valid
  end
end
