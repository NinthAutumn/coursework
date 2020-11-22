require "application_system_test_case"

class ParksTest < ApplicationSystemTestCase
  setup do
    @park = parks(:one)
  end

  test "visiting the index" do
    visit parks_url
    assert_selector "h1", text: "Parks"
  end

  test "creating a Park" do
    visit parks_url
    click_on "New Park"

    fill_in "Address line 1", with: @park.address_line_1
    fill_in "Address line 2", with: @park.address_line_2
    fill_in "Avatar", with: @park.avatar
    fill_in "Cover", with: @park.cover
    fill_in "Description", with: @park.description
    fill_in "Images", with: @park.images
    fill_in "Name", with: @park.name
    fill_in "Post code", with: @park.post_code
    click_on "Create Park"

    assert_text "Park was successfully created"
    click_on "Back"
  end

  test "updating a Park" do
    visit parks_url
    click_on "Edit", match: :first

    fill_in "Address line 1", with: @park.address_line_1
    fill_in "Address line 2", with: @park.address_line_2
    fill_in "Avatar", with: @park.avatar
    fill_in "Cover", with: @park.cover
    fill_in "Description", with: @park.description
    fill_in "Images", with: @park.images
    fill_in "Name", with: @park.name
    fill_in "Post code", with: @park.post_code
    click_on "Update Park"

    assert_text "Park was successfully updated"
    click_on "Back"
  end

  test "destroying a Park" do
    visit parks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Park was successfully destroyed"
  end
end
