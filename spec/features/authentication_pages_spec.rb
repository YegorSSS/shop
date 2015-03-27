require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Авторизация') }
    it { should have_title('Авторизация') }

    describe "with invalid information" do
      before { click_button "Войти" }

      it { should have_title('Авторизация') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Новинки" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:customer) { FactoryGirl.create(:customer) }
      before do
        fill_in "E-Mail",    with: customer.email.upcase
        fill_in "Пароль", with: customer.password
        click_button "Войти"
      end

      
      it { should have_link('Личный кабинет',     href: customer_path(customer)) }
      it { should have_link('Выйти',    href: signout_path) }
      it { should_not have_link('Войти', href: signin_path) }
      it { should have_content(customer.login)}

      describe "followed by signout" do
        before { click_link "Выйти" }
        it { should have_link('Войти') }
        it { should_not have_content(customer.login)}
      end
    end
  end
end
