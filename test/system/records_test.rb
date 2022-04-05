require "application_system_test_case"

class RecordsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit records_url
    assert_selector "h1", text: "Find a record"
  end

  test "searching for a record" do
    visit records_url
    fill_in "query", with: "Traumprinz"
    click_on "Search"
    assert_selector "h5", text: "Traumprinz"
  end

  test "visiting a record" do
    visit records_url
    fill_in "query", with: "Traumprinz"
    click_on "Search"
    click_on "Traumprinz"
    assert_selector "h3", text: "Traumprinz"
  end
end
