require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should create entry" do
    assert_difference("Entry.count") do
      post entries_url, params: { entry: { body: @entry.body, rating: @entry.rating, title: @entry.title } }
    end
    assert_redirected_to root_path
  end

  test "should show entry" do
    get entry_url(@entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { body: @entry.body, rating: @entry.rating, title: @entry.title } }
    assert_redirected_to root_path
  end

  test "should destroy entry" do
    assert_difference("Entry.count", -1) do
      delete entry_url(@entry)
    end
    assert_redirected_to root_path
  end
end