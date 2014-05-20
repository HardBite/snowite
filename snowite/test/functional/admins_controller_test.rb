require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
