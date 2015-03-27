class Informer < ActiveRecord::Base
  has_many :links
  validates :name, presence: true, length: { in: 3..20 }
  validates :informer_position, presence: true
end
