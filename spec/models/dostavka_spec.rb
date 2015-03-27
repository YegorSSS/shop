require 'spec_helper'

describe Dostavka do
  let(:dostavka) {Dostavka.new(name: 'Pochta')}

  subject{dostavka}

  it{should respond_to :name}
  it{should respond_to :orders}
  it{should be_valid}

  it 'with empty name' do
  	dostavka = Dostavka.new name: ' '
    expect(dostavka).not_to be_valid
  end
end
