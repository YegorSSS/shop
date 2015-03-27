require 'spec_helper'

describe Goodsinorder do
  before do
    @good = FactoryGirl.create :good
    @order = Order.create mail: 'redhgffs@yandex.ru'
  end
  let(:goodsinorder){Goodsinorder.new good_id: @good.id, order_id: @order.id, quantity: 2 }

  subject {goodsinorder}

  it{should respond_to :good_id}
  it{should respond_to :order_id}
  it{should respond_to :quantity}

  it { should respond_to (:good)}
  it { should respond_to (:order)}

  it { should be_valid }

  it "is invalid without an good_id, order_id, quantity" do
    expect(Goodsinorder.new good_id: nil, order_id: @order.id, quantity: 2).not_to be_valid
    expect(Goodsinorder.new good_id: @good.id, order_id: @order.id, quantity: nil).not_to be_valid
  end
end
