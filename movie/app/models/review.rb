class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  validates :score, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  validates :title, presence: true, length: { in: 3..90 }
  validates :text, presence: true, length: { in: 3..2500 }
end
