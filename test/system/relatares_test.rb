require "application_system_test_case"

class RelataresTest < ApplicationSystemTestCase
  setup do
    @relatare = relatares(:one)
  end

  test "visiting the index" do
    visit relatares_url
    assert_selector "h1", text: "Relatares"
  end

  test "creating a Relatare" do
    visit relatares_url
    click_on "New Relatare"

    fill_in "Texten", with: @relatare.texten
    fill_in "Textro", with: @relatare.textro
    fill_in "User", with: @relatare.user_id
    click_on "Create Relatare"

    assert_text "Relatare was successfully created"
    click_on "Back"
  end

  test "updating a Relatare" do
    visit relatares_url
    click_on "Edit", match: :first

    fill_in "Texten", with: @relatare.texten
    fill_in "Textro", with: @relatare.textro
    fill_in "User", with: @relatare.user_id
    click_on "Update Relatare"

    assert_text "Relatare was successfully updated"
    click_on "Back"
  end

  test "destroying a Relatare" do
    visit relatares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relatare was successfully destroyed"
  end
end
