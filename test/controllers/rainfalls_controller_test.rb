require 'test_helper'

class RainfallsControllerTest < ActionController::TestCase
  setup do
    @rainfall = rainfalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rainfalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rainfall" do
    assert_difference('Rainfall.count') do
      post :create, rainfall: { current: @rainfall.current, weather_id: @rainfall.weather_id }
    end

    assert_redirected_to rainfall_path(assigns(:rainfall))
  end

  test "should show rainfall" do
    get :show, id: @rainfall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rainfall
    assert_response :success
  end

  test "should update rainfall" do
    patch :update, id: @rainfall, rainfall: { current: @rainfall.current, weather_id: @rainfall.weather_id }
    assert_redirected_to rainfall_path(assigns(:rainfall))
  end

  test "should destroy rainfall" do
    assert_difference('Rainfall.count', -1) do
      delete :destroy, id: @rainfall
    end

    assert_redirected_to rainfalls_path
  end
end
