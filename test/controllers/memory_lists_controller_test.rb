require 'test_helper'

class MemoryListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @memory_list = memory_lists(:one)
  end

  test "should get index" do
    get memory_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_memory_list_url
    assert_response :success
  end

  test "should create memory_list" do
    assert_difference('MemoryList.count') do
      post memory_lists_url, params: { memory_list: { date_created: @memory_list.date_created, description: @memory_list.description, title: @memory_list.title } }
    end

    assert_redirected_to memory_list_url(MemoryList.last)
  end

  test "should show memory_list" do
    get memory_list_url(@memory_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_memory_list_url(@memory_list)
    assert_response :success
  end

  test "should update memory_list" do
    patch memory_list_url(@memory_list), params: { memory_list: { date_created: @memory_list.date_created, description: @memory_list.description, title: @memory_list.title } }
    assert_redirected_to memory_list_url(@memory_list)
  end

  test "should destroy memory_list" do
    assert_difference('MemoryList.count', -1) do
      delete memory_list_url(@memory_list)
    end

    assert_redirected_to memory_lists_url
  end
end
