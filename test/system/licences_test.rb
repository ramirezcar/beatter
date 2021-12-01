require "application_system_test_case"

class LicencesTest < ApplicationSystemTestCase
  setup do
    @licence = licences(:one)
  end

  test "visiting the index" do
    visit licences_url
    assert_selector "h1", text: "Licences"
  end

  test "creating a Licence" do
    visit licences_url
    click_on "New Licence"

    fill_in "File url", with: @licence.file_url
    fill_in "Price", with: @licence.price
    click_on "Create Licence"

    assert_text "Licence was successfully created"
    click_on "Back"
  end

  test "updating a Licence" do
    visit licences_url
    click_on "Edit", match: :first

    fill_in "File url", with: @licence.file_url
    fill_in "Price", with: @licence.price
    click_on "Update Licence"

    assert_text "Licence was successfully updated"
    click_on "Back"
  end

  test "destroying a Licence" do
    visit licences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Licence was successfully destroyed"
  end
end
