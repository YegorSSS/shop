class Order < ActiveRecord::Base
	has_many :goodsinorders
	belongs_to :dostavka
	belongs_to :payment

	accepts_nested_attributes_for :goodsinorders

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :mail, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
	
end
