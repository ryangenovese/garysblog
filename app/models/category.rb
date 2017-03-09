class Category < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 25 } #validates there is a name for a category, also length
  validates_uniqueness_of :name #validating unique name of category
end