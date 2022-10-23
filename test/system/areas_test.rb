require "application_system_test_case"

class AreasTest < ApplicationSystemTestCase
  setup do
    @area = areas(:one)
  end

  test "visiting the index" do
    visit areas_url
    assert_selector "h1", text: "Areas"
  end

  test "should create area" do
    visit areas_url
    click_on "New area"

    fill_in "Address", with: @area.address
    fill_in "Color", with: @area.color
    fill_in "Content", with: @area.content
    fill_in "Crest", with: @area.crest
    fill_in "Name", with: @area.name
    fill_in "Shrine", with: @area.shrine_id
    click_on "Create Area"

    assert_text "Area was successfully created"
    click_on "Back"
  end

  test "should update Area" do
    visit area_url(@area)
    click_on "Edit this area", match: :first

    fill_in "Address", with: @area.address
    fill_in "Color", with: @area.color
    fill_in "Content", with: @area.content
    fill_in "Crest", with: @area.crest
    fill_in "Name", with: @area.name
    fill_in "Shrine", with: @area.shrine_id
    click_on "Update Area"

    assert_text "Area was successfully updated"
    click_on "Back"
  end

  test "should destroy Area" do
    visit area_url(@area)
    click_on "Destroy this area", match: :first

    assert_text "Area was successfully destroyed"
  end
end
