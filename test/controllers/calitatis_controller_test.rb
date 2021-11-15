require "test_helper"

class CalitatisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calitati = calitatis(:one)
  end

  test "should get index" do
    get calitatis_url
    assert_response :success
  end

  test "should get new" do
    get new_calitati_url
    assert_response :success
  end

  test "should create calitati" do
    assert_difference('Calitati.count') do
      post calitatis_url, params: { calitati: { denumire: @calitati.denumire } }
    end

    assert_redirected_to calitati_url(Calitati.last)
  end

  test "should show calitati" do
    get calitati_url(@calitati)
    assert_response :success
  end

  test "should get edit" do
    get edit_calitati_url(@calitati)
    assert_response :success
  end

  test "should update calitati" do
    patch calitati_url(@calitati), params: { calitati: { denumire: @calitati.denumire } }
    assert_redirected_to calitati_url(@calitati)
  end

  test "should destroy calitati" do
    assert_difference('Calitati.count', -1) do
      delete calitati_url(@calitati)
    end

    assert_redirected_to calitatis_url
  end
end
