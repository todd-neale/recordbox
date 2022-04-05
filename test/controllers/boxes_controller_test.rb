require "test_helper"

class BoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @box = boxes(:one)
  end

  test "should get index" do
    get boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_box_url
    assert_response :success
  end

  test "should create box" do
    assert_difference('Box.count') do
      post boxes_url, params: { box: { comment: @box.comment, name: @box.name, user_id: @box.user_id } }
    end

    assert_redirected_to box_url(Box.last)
  end

  test "should show box" do
    get box_url(@box)
    assert_response :success
  end

  test "should get edit" do
    get edit_box_url(@box)
    assert_response :success
  end

  test "should update box" do
    patch box_url(@box), params: { box: { comment: @box.comment, name: @box.name, user_id: @box.user_id } }
    assert_redirected_to box_url(@box)
  end

end
