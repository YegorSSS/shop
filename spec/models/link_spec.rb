require 'spec_helper'

describe Link do
  let(:link){FactoryGirl.create :link}

  subject{link}

  it{should respond_to(:title)}
  it{should respond_to(:keyword)}
  it{should respond_to(:description)}
  it{should respond_to(:content)}
  it{should respond_to(:link_position)}
  it{should respond_to(:informer)}
 
  it 'uniqiness for title' do 
    expect(FactoryGirl.build :link, title: link.title).not_to be_valid
  end
end
