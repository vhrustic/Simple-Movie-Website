class Film < ApplicationRecord
	validates :name, presence: true, length: {in: 1..90}
	validates :year, presence: true, :numericality => { :greater_than => 1900, :less_than_or_equal_to => 2019 }
	validates :director, presence: true
	validates_format_of :director, with: /[\w]+([\s]+[\w]+){1}+/
	validates_length_of :director, minimum: 3, maximum: 50
	validates :stars, presence: true
	validates_length_of :stars, minimum: 4, maximum: 180
end
