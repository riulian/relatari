require "test_helper"

class RelataresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relatare = relatares(:one)
  end

  test "should get index" do
    get relatares_url
    assert_response :success
  end

  test "should get new" do
    get new_relatare_url
    assert_response :success
  end

  test "should create relatare" do
    assert_difference('Relatare.count') do
      post relatares_url, params: { relatare: { texten: @relatare.texten, textro: @relatare.textro, user_id: @relatare.user_id } }
    end

    assert_redirected_to relatare_url(Relatare.last)
  end

  test "should show relatare" do
    get relatare_url(@relatare)
    assert_response :success
  end

  test "should get edit" do
    get edit_relatare_url(@relatare)
    assert_response :success
  end

  test "should update relatare" do
    patch relatare_url(@relatare), params: { relatare: { texten: @relatare.texten, textro: @relatare.textro, user_id: @relatare.user_id } }
    assert_redirected_to relatare_url(@relatare)
  end

  test "should destroy relatare" do
    assert_difference('Relatare.count', -1) do
      delete relatare_url(@relatare)
    end

    assert_redirected_to relatares_url
  end
end
