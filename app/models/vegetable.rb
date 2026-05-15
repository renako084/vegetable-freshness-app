class Vegetable < ApplicationRecord
  has_many :stocks
  validates :name, presence: true
  validates :shelf_life_days, presence: true, numericality: { greater_than: 0 }
end