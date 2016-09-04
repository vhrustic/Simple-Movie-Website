class Film < ApplicationRecord
	has_many :reviews

	validates :name, presence: true, length: {in: 1..90}
	validates :year, presence: true, :numericality => { :greater_than => 1900, :less_than_or_equal_to => 2019 }
	validates :director, presence: true
	validates_format_of :director, with: /[\w]+([\s]+[\w]+){1}+/
	validates_length_of :director, minimum: 3, maximum: 50
	validates :stars, presence: true
	validates_length_of :stars, minimum: 4, maximum: 180

	def calculate_new_rating(score)
		if self.votes == 0
			self.votes += 1
			self.rating = score
		else
			sum = self.rating * self.votes + score.to_f
			self.votes += 1
			self.rating = sum / self.votes.to_f
		end
	end
end
