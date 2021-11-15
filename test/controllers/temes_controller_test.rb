require "test_helper"

class TemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teme = temes(:one)
  end

  test "should get index" do
    get temes_url
    assert_response :success
  end

  test "should get new" do
    get new_teme_url
    assert_response :success
  end

  test "should create teme" do
    assert_difference('Teme.count') do
      post temes_url, params: { teme: { denumire: @teme.denumire, despre: @teme.despre } }
    end

    assert_redirected_to teme_url(Teme.last)
  end

  test "should show teme" do
    get teme_url(@teme)
    assert_response :success
  end

  test "should get edit" do
    get edit_teme_url(@teme)
    assert_response :success
  end

  test "should update teme" do
    patch teme_url(@teme), params: { teme: { denumire: @teme.denumire, despre: @teme.despre } }
    assert_redirected_to teme_url(@teme)
  end

  test "should destroy teme" do
    assert_difference('Teme.count', -1) do
      delete teme_url(@teme)
    end

    assert_redirected_to temes_url
  end
end
