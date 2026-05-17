class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :vegetable

  enum status: { active: 0, eaten: 1, discarded: 2 }

  validates :purchased_on, presence: true
  validates :status, presence: true

  def elapsed_days
    (Date.today - purchased_on).to_i
  end

  def priority_color
    remaining_days = vegetable.shelf_life_days - elapsed_days
    if remaining_days <= 1
      "red"
    elsif remaining_days <= 3
      "yellow"
    else
      "green"
    end
  end
end