# frozen_string_literal: true

require 'application_system_test_case'

class LibrariesTest < ApplicationSystemTestCase
  setup do
    @library = libraries(:one)
  end

  test 'visiting the index' do
    visit libraries_url
    assert_selector 'h1', text: 'Libraries'
  end

  test 'should create library' do
    visit libraries_url
    click_on 'New library'

    fill_in 'Email', with: @library.email
    fill_in 'Established date', with: @library.established_date
    fill_in 'Library', with: @library.library_id
    fill_in 'Location', with: @library.location
    fill_in 'Name', with: @library.name
    fill_in 'Opening hours end', with: @library.opening_hours_end
    fill_in 'Opening hours start', with: @library.opening_hours_start
    click_on 'Create Library'

    assert_text 'Library was successfully created'
    click_on 'Back'
  end

  test 'should update Library' do
    visit library_url(@library)
    click_on 'Edit this library', match: :first

    fill_in 'Email', with: @library.email
    fill_in 'Established date', with: @library.established_date
    fill_in 'Library', with: @library.library_id
    fill_in 'Location', with: @library.location
    fill_in 'Name', with: @library.name
    fill_in 'Opening hours end', with: @library.opening_hours_end
    fill_in 'Opening hours start', with: @library.opening_hours_start
    click_on 'Update Library'

    assert_text 'Library was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Library' do
    visit library_url(@library)
    click_on 'Destroy this library', match: :first

    assert_text 'Library was successfully destroyed'
  end
end
