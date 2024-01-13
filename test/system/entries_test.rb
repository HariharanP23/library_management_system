require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url
    assert_selector "h1", text: "Entries"
  end

  test "should create entry" do
    visit entries_url
    click_on "New entry"

    fill_in "Acquisition date", with: @entry.acquisition_date
    fill_in "Book", with: @entry.book_id
    fill_in "Due date", with: @entry.due_date
    fill_in "Fine amount", with: @entry.fine_amount
    fill_in "Library", with: @entry.library_id
    fill_in "Member", with: @entry.member_id
    fill_in "Return date", with: @entry.return_date
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "should update Entry" do
    visit entry_url(@entry)
    click_on "Edit this entry", match: :first

    fill_in "Acquisition date", with: @entry.acquisition_date
    fill_in "Book", with: @entry.book_id
    fill_in "Due date", with: @entry.due_date
    fill_in "Fine amount", with: @entry.fine_amount
    fill_in "Library", with: @entry.library_id
    fill_in "Member", with: @entry.member_id
    fill_in "Return date", with: @entry.return_date
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry" do
    visit entry_url(@entry)
    click_on "Destroy this entry", match: :first

    assert_text "Entry was successfully destroyed"
  end
end
