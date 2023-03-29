class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
end
