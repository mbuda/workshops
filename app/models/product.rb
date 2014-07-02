class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :price
  belongs_to :category
  belongs_to :user
  has_many :reviews

  def price
  end

  def average_rating
  end
end
