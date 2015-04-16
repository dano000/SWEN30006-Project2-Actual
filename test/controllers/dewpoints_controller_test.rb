require 'test_helper'

class DewpointsControllerTest < ActionController::TestCase
  setup do
    @dewpoint = dewpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dewpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dewpoint" do
    assert_difference('Dewpoint.count') do
      post :create, dewpoint: { current: @dewpoint.current, weather_id: @dewpoint.weather_id }
    end

    assert_redirected_to dewpoint_path(assigns(:dewpoint))
  end

  test "should show dewpoint" do
    get :show, id: @dewpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dewpoint
    assert_response :success
  end

  test "should update dewpoint" do
    patch :update, id: @dewpoint, dewpoint: { current: @dewpoint.current, weather_id: @dewpoint.weather_id }
    assert_redirected_to dewpoint_path(assigns(:dewpoint))
  end

  test "should destroy dewpoint" do
    assert_difference('Dewpoint.count', -1) do
      delete :destroy, id: @dewpoint
    end

    assert_redirected_to dewpoints_path
  end
end
