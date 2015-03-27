require 'spec_helper'

describe Informer do
  let(:informer){FactoryGirl.create :informer}

  subject { informer }

  it { should respond_to(:name) }
  it { should respond_to(:informer_position)}
  it { should respond_to :links }

  it 'default value 0 for informer_position' do
  	expect(Informer.create(name: 'jfhgyt').informer_position).to eq(0)
  end

  it 'length must be 3..20' do
    expect(FactoryGirl.build :informer, name: "12").not_to be_valid
    expect(FactoryGirl.build :informer, name: 'r' * 21).not_to be_valid
  end
end
