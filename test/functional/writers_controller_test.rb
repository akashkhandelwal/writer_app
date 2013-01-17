require 'test_helper'

class WritersControllerTest < ActionController::TestCase
  setup do
    @writer = writers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:writers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create writer" do
    assert_difference('Writer.count') do
      post :create, writer: { email: @writer.email, first_name: @writer.first_name, gender: @writer.gender, last_name: @writer.last_name, screen_name: @writer.screen_name }
    end

    assert_redirected_to writer_path(assigns(:writer))
  end

  test "should show writer" do
    get :show, id: @writer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @writer
    assert_response :success
  end

  test "should update writer" do
    put :update, id: @writer, writer: { email: @writer.email, first_name: @writer.first_name, gender: @writer.gender, last_name: @writer.last_name, screen_name: @writer.screen_name }
    assert_redirected_to writer_path(assigns(:writer))
  end

  test "should destroy writer" do
    assert_difference('Writer.count', -1) do
      delete :destroy, id: @writer
    end

    assert_redirected_to writers_path
  end
end
