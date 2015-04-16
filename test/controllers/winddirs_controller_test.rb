require 'test_helper'

class WinddirsControllerTest < ActionController::TestCase
  setup do
    @winddir = winddirs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:winddirs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create winddir" do
    assert_difference('Winddir.count') do
      post :create, winddir: { current: @winddir.current, weather_id: @winddir.weather_id }
    end

    assert_redirected_to winddir_path(assigns(:winddir))
  end

  test "should show winddir" do
    get :show, id: @winddir
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @winddir
    assert_response :success
  end

  test "should update winddir" do
    patch :update, id: @winddir, winddir: { current: @winddir.current, weather_id: @winddir.weather_id }
    assert_redirected_to winddir_path(assigns(:winddir))
  end

  test "should destroy winddir" do
    assert_difference('Winddir.count', -1) do
      delete :destroy, id: @winddir
    end

    assert_redirected_to winddirs_path
  end
end
