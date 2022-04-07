require "test_helper"

class BoxTest < ActiveSupport::TestCase
  test "should not save box without name" do
    box = Box.new
    assert_not box.save, "Saved the box without a name"
  end

  test "should not save box without user" do
    box = Box.new(name: "Test Box")
    assert_not box.save, "Saved the box without a user"
  end

  test "should save box with name and user" do
    box = Box.new(name: "Test Box", user: users(:richard))
    assert box.save, "Did not save the box with a name and user"
  end
  
end
