require 'spec_helper'

describe Payment do
  let(:payment) {Payment.new(name: 'Наложенный платеж')}

  subject{payment}

  it{should respond_to :name}
  it{should respond_to :orders}
  it{should be_valid}

  it 'with empty name' do
  	payment = Payment.new name: ' '
    expect(payment).not_to be_valid
  end
end
