# app/models/item.rb
class Item < ApplicationRecord
  belongs_to :warehouse
  validates :name, :type_of_item, presence: true
  enum type_of_item: { beehives: 0, books: 1, clothes: 2, computers: 3, paintings: 4, billard_balls: 5 }
end
