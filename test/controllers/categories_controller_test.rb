require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")  #this creates something to pass for the show test below
  end
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id}) #will generate the route for show
    assert_response :success
  end
end
