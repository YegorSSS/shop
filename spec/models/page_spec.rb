require 'spec_helper'

describe Page do
  let(:page){ FactoryGirl.create :page}
  subject{page}

  it{should respond_to :title}
  it{should respond_to :keyword}
  it{should respond_to :description}
  it{should respond_to :content}
  it{should respond_to :position}

end
