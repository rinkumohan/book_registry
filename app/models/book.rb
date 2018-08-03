class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :book_name, :author, :price,:category,:isbn, :presence => true
  validates :price, :numericality => { greater_than_or_equal_to: 0}
  validates :isbn, format: { with: /\A\d+\z/, message: "must be a number. String and special characters are not allowed." }

end
