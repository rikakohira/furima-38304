class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9999999 }
 
  belongs_to :user
end
