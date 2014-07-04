class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :price
  validates :price, numericality: { greater_than_or_equal_to: 0},
    format: { with: /(\A\d+)(\.\d{1,2})?\z/ }

  belongs_to :category
  belongs_to :user
  has_many :reviews

  def average_rating
    reviews.inject(0.0){ |sum, review| sum + review.rating } / reviews.length
  end
end
