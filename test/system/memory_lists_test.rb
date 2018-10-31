require "application_system_test_case"

class MemoryListsTest < ApplicationSystemTestCase
  setup do
    @memory_list = memory_lists(:one)
  end

  test "visiting the index" do
    visit memory_lists_url
    assert_selector "h1", text: "Memory Lists"
  end

  test "creating a Memory list" do
    visit memory_lists_url
    click_on "New Memory List"

    fill_in "Date Created", with: @memory_list.date_created
    fill_in "Description", with: @memory_list.description
    fill_in "Title", with: @memory_list.title
    click_on "Create Memory list"

    assert_text "Memory list was successfully created"
    click_on "Back"
  end

  test "updating a Memory list" do
    visit memory_lists_url
    click_on "Edit", match: :first

    fill_in "Date Created", with: @memory_list.date_created
    fill_in "Description", with: @memory_list.description
    fill_in "Title", with: @memory_list.title
    click_on "Update Memory list"

    assert_text "Memory list was successfully updated"
    click_on "Back"
  end

  test "destroying a Memory list" do
    visit memory_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Memory list was successfully destroyed"
  end
end
