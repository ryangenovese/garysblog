require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup #runs before every test
    @category = Category.new(name: "sports") #test category of sports
  end
  
  test "category should be valid" do #first test
    assert @category.valid?  #is category model available? #will also look for categories table
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?   #is name present for category; look in category model
  end
  
  test "name should be unique" do
    @category.save       #hit test database first and save category
    category2 = Category.new(name: "sports") #create category 2
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26 # name cannot be longer than 26 characters
    assert_not @category.valid? # if longer than 26, fail
    
  end
  
  test "name should not be too short" do
    @category.name  = "aa" # name cannot be shorter than 2 characters
    assert_not @category.valid? # if shorter, fail
  end
end