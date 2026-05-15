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
    ratio = elapsed_days.to_f / vegetable.shelf_life_days
    if ratio >= 0.9
      "red"
    elsif ratio >= 0.7
      "yellow"
    else
      "green"
    end
  end
end