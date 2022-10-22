require "application_system_test_case"

class ShrinesTest < ApplicationSystemTestCase
  setup do
    @shrine = shrines(:one)
  end

  test "visiting the index" do
    visit shrines_url
    assert_selector "h1", text: "Shrines"
  end

  test "should create shrine" do
    visit shrines_url
    click_on "New shrine"

    fill_in "Address", with: @shrine.address
    fill_in "Name", with: @shrine.name
    click_on "Create Shrine"

    assert_text "Shrine was successfully created"
    click_on "Back"
  end

  test "should update Shrine" do
    visit shrine_url(@shrine)
    click_on "Edit this shrine", match: :first

    fill_in "Address", with: @shrine.address
    fill_in "Name", with: @shrine.name
    click_on "Update Shrine"

    assert_text "Shrine was successfully updated"
    click_on "Back"
  end

  test "should destroy Shrine" do
    visit shrine_url(@shrine)
    click_on "Destroy this shrine", match: :first

    assert_text "Shrine was successfully destroyed"
  end
end
