class FoodComment < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :body, presence: true
end
