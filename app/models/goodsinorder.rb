class Goodsinorder < ActiveRecord::Base
  belongs_to :order
  belongs_to :good
  
  #validates :order_id, presence: true
  validates :good_id, presence: true
  validates :quantity, presence: true
end
