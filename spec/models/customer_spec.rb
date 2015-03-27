require 'spec_helper'

describe Customer do
  
  before do 
  	@customer = Customer.new(name: 'Васюков Вася', email: 'jghtud@yandex.ru', 
  		login: 'Vasya', address: 'г. Киев, ул.Мудяково, 13', tel: '354-76-48',
  		password: 'hfjrhy')
  end

  subject {@customer}

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:login) }
  it { should respond_to(:address) }
  it { should respond_to(:tel) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "when email is not present" do
    before {@customer.email = " "}
    it {should_not be_valid}
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @customer.email = invalid_address
        expect(@customer).not_to be_valid
	  end
	end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @customer.email = valid_address
        expect(@customer).to be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @customer.dup
      user_with_same_email.email = @customer.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @customer.email = mixed_case_email
      @customer.save
      expect(@customer.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "when password is not present" do
    before do
      @customer = Customer.new(name: "Example User", email: "user@example.com",
                       password: " ")
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @customer.password = "a" * 4 }
    it { should be_invalid }
  end

  describe "when login is too long" do
    before { @customer.login = "a" * 51 }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @customer.save }
    let(:found_customer) { Customer.find_by(email: @customer.email) }

    describe "with valid password" do
      it { should eq found_customer.authenticate(@customer.password) }
    end

    describe "with invalid password" do
      let(:customer_for_invalid_password) { found_customer.authenticate("invalid") }

      it { should_not eq customer_for_invalid_password }
      specify { expect(customer_for_invalid_password).to be_false }
    end
  end

  describe "remember token" do
    before { @customer.save }
    its(:remember_token) { should_not be_blank }
  end
end
