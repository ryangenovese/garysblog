class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :article, through: :article_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 } #validates there is a name for a category, also length
  validates_uniqueness_of :name #validating unique name of category
end