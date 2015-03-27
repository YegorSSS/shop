require 'spec_helper'

describe Order do
  let(:order){Order.new mail: 'jfhfgy@hfyrg.ru'}

  subject{order}

  it{should respond_to :mail}
  it{should respond_to :customer_id}
  it{should respond_to :dostavka_id}
  it{should respond_to :payment_id}
  it{should respond_to :status}
  it{should respond_to :tel}
  it{should respond_to :address}
  it{should respond_to :name}
  it{should respond_to :detail}
  
  it{should respond_to :goodsinorders}
  it{should respond_to :dostavka}
  it{should respond_to :payment}
  it{should be_valid}

  describe "when mail is not present" do
    before {order.mail = " "}
    it {should_not be_valid}
  end

  describe "when mail format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        order.mail = invalid_address
        expect(order).not_to be_valid
	  end
	end
  end
end
