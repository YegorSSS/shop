module SessionsHelper

  def sign_in_customer(customer)
    remember_token = Customer.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    customer.update_attribute(:remember_token, Customer.encrypt(remember_token))
    self.current_customer = customer
  end

  def signed_in_customer?
    !current_customer.nil?
  end

  def current_customer=(customer)
    @current_customer = customer
  end

  def current_customer
    remember_token = Customer.encrypt(cookies[:remember_token])
    @current_customer ||= Customer.find_by(remember_token: remember_token)
  end

  def sign_out_customer
    current_customer.update_attribute(:remember_token,
                                  Customer.encrypt(Customer.new_remember_token))
    cookies.delete(:remember_token)
    self.current_customer = nil
  end
end