# app/models/warehouse.rb
class Warehouse < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, :address, :capacity, presence: true
end
