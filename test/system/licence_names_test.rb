require "application_system_test_case"

class LicenceNamesTest < ApplicationSystemTestCase
  setup do
    @licence_name = licence_names(:one)
  end

  test "visiting the index" do
    visit licence_names_url
    assert_selector "h1", text: "Licence Names"
  end

  test "creating a Licence name" do
    visit licence_names_url
    click_on "New Licence Name"

    fill_in "Name", with: @licence_name.name
    click_on "Create Licence name"

    assert_text "Licence name was successfully created"
    click_on "Back"
  end

  test "updating a Licence name" do
    visit licence_names_url
    click_on "Edit", match: :first

    fill_in "Name", with: @licence_name.name
    click_on "Update Licence name"

    assert_text "Licence name was successfully updated"
    click_on "Back"
  end

  test "destroying a Licence name" do
    visit licence_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Licence name was successfully destroyed"
  end
end
