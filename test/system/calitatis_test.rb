require "application_system_test_case"

class CalitatisTest < ApplicationSystemTestCase
  setup do
    @calitati = calitatis(:one)
  end

  test "visiting the index" do
    visit calitatis_url
    assert_selector "h1", text: "Calitatis"
  end

  test "creating a Calitati" do
    visit calitatis_url
    click_on "New Calitati"

    fill_in "Denumire", with: @calitati.denumire
    click_on "Create Calitati"

    assert_text "Calitati was successfully created"
    click_on "Back"
  end

  test "updating a Calitati" do
    visit calitatis_url
    click_on "Edit", match: :first

    fill_in "Denumire", with: @calitati.denumire
    click_on "Update Calitati"

    assert_text "Calitati was successfully updated"
    click_on "Back"
  end

  test "destroying a Calitati" do
    visit calitatis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calitati was successfully destroyed"
  end
end
