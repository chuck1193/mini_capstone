class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
 
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: 254}
  
  validates :description, presence: true
  validates :description, length: {in: 10..300}
  
  validates :price, presence: true
  validates :price, numericality: {less_than: 10_000, greater_then: 0}

  def is_discounted?
     price < 10
  end

  def tax
    price * 0.09 
  end

  def total
    price + tax
  end
end
