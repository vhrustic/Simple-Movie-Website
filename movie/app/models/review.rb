class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  validates :score, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  validates :title, presence: true, length: { in: 3..90 }
  validates :text, presence: true, length: { in: 3..2500 }
  validates_uniqueness_of :user_id, :scope => [:film_id], message: "You have already reviewed this movie"

  def own_review?(user)
  	self.user_id == user.id
  end
end
