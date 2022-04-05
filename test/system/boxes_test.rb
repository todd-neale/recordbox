require "application_system_test_case"

class BoxesTest < ApplicationSystemTestCase
  test "lets a signed in user visit their box index" do
    login_as users(:richard)
    visit boxes_url
  
    assert_selector "h1", text: "Boxes"
  end

  test "lets a signed in user create a new box" do
    login_as users(:richard)
    visit "/boxes/new"
    # save_and_open_screenshot

    fill_in "box_name", with: "Minimal"
    fill_in "box_comment", with: "Something to chill to 🍹☀️"
    # save_and_open_screenshot

    click_on 'Create Box'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_text "Something to chill to 🍹☀️"
  end
end
