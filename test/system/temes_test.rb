require "application_system_test_case"

class TemesTest < ApplicationSystemTestCase
  setup do
    @teme = temes(:one)
  end

  test "visiting the index" do
    visit temes_url
    assert_selector "h1", text: "Temes"
  end

  test "creating a Teme" do
    visit temes_url
    click_on "New Teme"

    fill_in "Denumire", with: @teme.denumire
    fill_in "Despre", with: @teme.despre
    click_on "Create Teme"

    assert_text "Teme was successfully created"
    click_on "Back"
  end

  test "updating a Teme" do
    visit temes_url
    click_on "Edit", match: :first

    fill_in "Denumire", with: @teme.denumire
    fill_in "Despre", with: @teme.despre
    click_on "Update Teme"

    assert_text "Teme was successfully updated"
    click_on "Back"
  end

  test "destroying a Teme" do
    visit temes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teme was successfully destroyed"
  end
end
