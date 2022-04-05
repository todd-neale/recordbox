require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { box_id: @tag.box_id, record_id: @tag.record_id } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end
end
