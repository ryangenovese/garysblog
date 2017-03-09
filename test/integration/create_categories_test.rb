require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path #going to new cat path
    assert_template 'categories/new' # send to new
    assert_difference 'Category.count', 1 do  # looking for difference in category count
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index' # send to index
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do
    get new_category_path #going to new cat path
    assert_template 'categories/new' # send to new
    assert_no_difference 'Category.count' do  
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new' # send to index
    assert_select 'h2.panel-title' # looking in errros partial in shared folder for h2
    assert_select 'div.panel-body' # looking in errros partial in shared folder for div
    # if these show, then errors partial is being rendered
  end
end