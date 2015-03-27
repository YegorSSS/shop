require 'spec_helper'

describe News do
  let(:news){FactoryGirl.create :news}
  subject{news}

  it{should respond_to :title}
  it{should respond_to :keywords}
  it{should respond_to :description}
  it{should respond_to :anons}
  it{should respond_to :content}

  
end
