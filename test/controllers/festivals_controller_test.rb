require "test_helper"

class FestivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @festival = festivals(:one)
  end

  test "should get index" do
    get festivals_url
    assert_response :success
  end

  test "should get new" do
    get new_festival_url
    assert_response :success
  end

  test "should create festival" do
    assert_difference("Festival.count") do
      post festivals_url, params: { festival: { content: @festival.content, name: @festival.name, shrine_id: @festival.shrine_id } }
    end

    assert_redirected_to festival_url(Festival.last)
  end

  test "should show festival" do
    get festival_url(@festival)
    assert_response :success
  end

  test "should get edit" do
    get edit_festival_url(@festival)
    assert_response :success
  end

  test "should update festival" do
    patch festival_url(@festival), params: { festival: { content: @festival.content, name: @festival.name, shrine_id: @festival.shrine_id } }
    assert_redirected_to festival_url(@festival)
  end

  test "should destroy festival" do
    assert_difference("Festival.count", -1) do
      delete festival_url(@festival)
    end

    assert_redirected_to festivals_url
  end
end
