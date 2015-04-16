require 'test_helper'

class WindspeedsControllerTest < ActionController::TestCase
  setup do
    @windspeed = windspeeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:windspeeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create windspeed" do
    assert_difference('Windspeed.count') do
      post :create, windspeed: { current: @windspeed.current, weather_id: @windspeed.weather_id }
    end

    assert_redirected_to windspeed_path(assigns(:windspeed))
  end

  test "should show windspeed" do
    get :show, id: @windspeed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @windspeed
    assert_response :success
  end

  test "should update windspeed" do
    patch :update, id: @windspeed, windspeed: { current: @windspeed.current, weather_id: @windspeed.weather_id }
    assert_redirected_to windspeed_path(assigns(:windspeed))
  end

  test "should destroy windspeed" do
    assert_difference('Windspeed.count', -1) do
      delete :destroy, id: @windspeed
    end

    assert_redirected_to windspeeds_path
  end
end
