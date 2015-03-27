require 'spec_helper'

describe "Customer pages" do

  subject { page }

  describe "signup page" do

    before { visit new_customer_path }

    let(:submit) { "Регистрация" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Customer, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Логин*",        with: "Userlogin"
        fill_in "Ф.И.О.",         with: "Example User"
        fill_in "E-Mail*",        with: "user@example.com"
        fill_in "Пароль*",     with: "foobar"
      end

      it "should create a customer" do
        expect { click_button submit }.to change(Customer, :count).by(1)
      end

      describe "after saving the customer" do
        before { click_button submit }
        let(:customer) { Customer.find_by(email: 'user@example.com') }

        it { should have_link('Выйти') }
        it { should have_selector('div.alert.alert-success', text: 'Добро пожаловать!') }
        it { should have_content (customer.login) }
      end
    end
  end

  
end